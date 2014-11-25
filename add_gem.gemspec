require File.expand_path('../lib/add_gem/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adolfo Builes", "Nicolas Hock"]
  gem.email         = ["builes.adolfo@gmail.com", "nhocki@gmail.com"]
  gem.description   = %q{"Command-line tool to append new gems to your Gemfile."}
  gem.summary       = %q{"Command-line tool to append new gems to your Gemfile."}
  gem.homepage      = "https://github.com/abuiles/add_gem"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = "add_gem"
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "add_gem"
  gem.require_paths = ["lib"]
  gem.version       = AddGem::VERSION

  gem.add_development_dependency('rake', '~> 10.3.2')
end
