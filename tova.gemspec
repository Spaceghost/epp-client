# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tova/version'

Gem::Specification.new do |spec|
  spec.name          = "tova"
  spec.version       = Tova::VERSION
  spec.authors       = ["NCC Group Domain Services"]
  spec.email         = ["ds-development@nccgroup.com"]
  spec.summary       = %q{EPP client. Tova, because all good epp-related names were taken. This one is better anyways.}
  spec.description   = %q{EPP client. Tova, because all good epp-related names were taken. This one is better anyways.}
  spec.homepage      = "https://github.com/ArtemisInternet/epp-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
