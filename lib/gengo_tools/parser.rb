require 'nokogiri'

module GengoTools
  class Parser
    def initialize(directory_path)
      raise "directory_path must be specified" unless directory_path.present?
      @directory_path = directory_path
    end

    def translations
      files.each_with_object(empty_result) do |path, result|
        text, language_code, translation = parse_file(path)
        key = keyify text
        result[language_code][key] = translation if translation
        result['en'][key] = text
      end
    end

    private

    def keyify(text)
      text.underscore.gsub(/\s+/, '_')
    end

    def empty_result
      Hash.new { |h, k| h[k] = Hash.new }
    end

    def files
      Dir["#{@directory_path}/*.html"]
    end

    def parse_file(path)
      doc = Nokogiri::HTML(open(path))
      text = doc.css('#original-text div pre').first&.content&.strip
      language_code = to_iso_language_code(doc.css('#target-text .target-lang').first&.content&.strip)
      translation = doc.css('#target-text div pre').first&.content&.strip

      [text, language_code, translation]
    end

    LANGUAGES = {
      'Chinese' => 'zh',
      'French'  => 'fr',
      'German'  => 'de',
      'Italian' => 'it',
      'Spanish' => 'es',
    }.freeze

    REGIONS = {
      'Canada' => 'CA',
      'Latin America' => '419'
    }.freeze

    def to_iso_language_code(value)
      matcher = /([^\(]+)(?:\s*\(([^\)]+)\))?/.match(value)

      language = matcher[1].strip
      region = matcher[2]&.strip

      language_code = LANGUAGES[language]
      region_code = REGIONS[region]

      if region_code
        "#{language_code}-#{region_code}"
      else
        language_code
      end
    end
  end
end
