# GengoTools

GengoTools provides a library of rake tasks that facilitate the incorporation of translations obtained from Gengo into a Rails application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gengo_tools', group: :development
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gengo_tools

## Usage

To import translations from a set of raw HTML files downloaded to
`/MyDownloads/MyDownloadedFiles into the Rails app, targeting the
localization files named `reservations.*`, putting the translations
under the keys `reservations`, then `labels`.
```
rake gengo_tools:merge SOURCE_DIR=/MyDownloads/MyDownloadedTranslationFiles TARGET_DIR=config/locales KEY_PATH=reservations:labels FILE_ROOT_NAME=reservations
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gengo_tools.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
