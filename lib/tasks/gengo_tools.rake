namespace :gengo_tools do
  desc 'Merge transactions found in the specified directory (DIR) with the existing i18n files'
  task merge: :environment do
    translations = GengoTools::Parser.new(ENV['DIR']).translations
  end
end

