# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid_paginate/version'

Gem::Specification.new do |spec|
  spec.name          = "mongoid_paginate"
  spec.version       = MongoidPaginate::VERSION
  spec.authors       = ["Sean Lerner"]
  spec.email         = ["seanslerner@gmail.com"]
  spec.description   = "Simple pagination."
  spec.summary       = "Pagination for Mongoid ODM"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mongoid", ">= 4.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
