# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kamecenter/version'

Gem::Specification.new do |spec|
  spec.name          = "kamecenter"
  spec.version       = Kamecenter::VERSION
  spec.authors       = ["kevstessens"]
  spec.email         = ["kevstessens@gmail.com"]
  spec.description   = "Testing gem DPOI"
  spec.summary       = "summary"
  spec.homepage      = "http://www.flipstudios.com.ar"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 0"
end
