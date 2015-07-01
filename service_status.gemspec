# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'service_status/version'

Gem::Specification.new do |spec|
  spec.name          = "service_status"
  spec.version       = ServiceStatus::VERSION
  spec.authors       = ["Olga Scott"]
  spec.email         = ["hello@olga-scott.com"]

  spec.summary       = "simple gem for the Service Status app"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "httparty", "~> 0.13.5"
end
