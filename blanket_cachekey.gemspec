# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blanket_cachekey/version'

Gem::Specification.new do |spec|
  spec.name          = "blanket_cachekey"
  spec.version       = BlanketCachekey::VERSION
  spec.authors       = ["Karl Baum"]
  spec.email         = ["karl.baum@gmail.com"]
  spec.description   = %q{Provides a rails cache key for caching data that should be invalidated whenever any ActiveRecord instance of a specific type is created, updated, or destroyed.}
  spec.summary       = %q{Provides a rails cache key for caching data that should be invalidated whenever any ActiveRecord instance of a specific type is created, updated, or destroyed.}
  spec.homepage      = "https://github.com/kbaum/blanket_cachekey"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3"
end
