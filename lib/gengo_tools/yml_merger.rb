require 'yaml'

module GengoTools
  class YmlMerger
    def initialize(dir: 'config/locales', key_path: [], file_root_name: nil)
      @dir = dir
      @key_path = key_path
      @file_root_name = file_root_name
    end

    def merge(translation_map)
      translation_map.each do |lang, translations|
        merge_file lang, translations
      end
    end

    private

    def merge_file(lang, translations)
      path = Dir[file_search_path(lang)].first
      data = read_file(path)
      translations.each do |key, value|
        root_map = data[lang]
        working_map = @key_path.reduce(root_map) do |parent, segment|
          parent[segment]
        end
        working_map[key] = value
      end
      write_file path, data
    end

    def file_search_path(lang)
      if @file_root_name
        "#{@dir}/#{@file_root_name}.#{lang}.yml"
      else
        "#{@dir}/#{lang}.yml"
      end
    end

    def read_file(path)
      File.open(path, 'r') do |file|
        Psych.load_file file
      end
    end

    def write_file(path, data)
      File.open(path, 'w') do |file|
        file.write Psych.dump(data)
      end
    end
  end
end
