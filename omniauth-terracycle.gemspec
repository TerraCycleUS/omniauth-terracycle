# coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require 'omniauth-terracycle/version'
require File.expand_path('../lib/omniauth-terracycle/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-terracycle"
  spec.version       = OmniAuth::TerraCycle::VERSION
  spec.authors       = ["Gabor Babicz"]
  spec.email         = ["gabor.babicz@gmail.com"]
  spec.description   = %q{OmniAuth strategy for TerraCycle}
  spec.summary       = %q{OmniAuth strategy for Terracycle}
  spec.homepage      = "https://github.com/terracycle/omniauth-terracycle"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'omniauth', '~> 1.2'
  spec.add_dependency 'omniauth-oauth2', '~> 1.1'
end
