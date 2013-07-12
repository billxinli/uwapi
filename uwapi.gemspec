# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uwapi/version'

Gem::Specification.new do |spec|
  spec.name          = 'uwapi'
  spec.version       = Uwapi::VERSION
  spec.authors       = ['Bill Li']
  spec.email         = ['me@billxinli.com']
  spec.description   = %q{University of Waterloo OpenData API Ruby Implementation}
  spec.summary       = %q{University of Waterloo OpenData API Ruby Implementation}
  spec.homepage      = 'https://github.com/billxinli/uwapi'
  spec.license       = 'MIT'
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_dependency('httparty')
  spec.add_dependency('json')
  spec.add_development_dependency('bundler', '~> 1.3')
  spec.add_development_dependency('rake')
end
