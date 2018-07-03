
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gengo_tools/version"

Gem::Specification.new do |spec|
  spec.name          = "gengo_tools"
  spec.version       = GengoTools::VERSION
  spec.authors       = ["Doug Knight"]
  spec.email         = ["dknight@getaroom.com"]

  spec.summary       = %q{Provides tools for working with Gengo translation files}
  spec.description   = %q{Gengo doesn't offer a lot of tools for working with application i18n features. This gem seeks to make it easy to get transactions out of there files and into your application.}
  spec.homepage      = "https://github.com/getaroom/gengo_tools"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'rspec-collection_matchers'
  spec.add_development_dependency 'nokogiri'
  spec.add_development_dependency 'activesupport'
end
