require 'yaml'

namespace :gengo_tools do
  desc 'Extract the translations from SOURCE_DIR and return them in FORMAT'
  task extract: :environment do
    translations = GengoTools::Parser.new(ENV['SOURCE_DIR']).translations
    case ENV['FORMAT']&.downcase

    when nil, 'json'
      puts JSON.pretty_generate translations

    when 'yml', 'yaml'
      puts Psych.dump translations

    else
      puts "The format #{ENV['FORMAT']} is not supported. Try JSON or YAML"
    end
  end

  desc 'Merge transactions found in the specified directory (SOURCE_DIR) with the existing i18n files'
  task merge: :environment do
    puts "Parsing translations..."
    translations = GengoTools::Parser.new(ENV['SOURCE_DIR']).translations
    puts "Found translations for #{translations.count} term(s)"
    puts "Merging translations..."
    GengoTools::YmlMerger.new(
      dir: ENV['TARGET_DIR'],
      key_path: ENV['KEY_PATH'].split(':'),
      file_root_name: ENV['FILE_ROOT_NAME']
    ).merge(translations)
    puts "Done."
  end
end

