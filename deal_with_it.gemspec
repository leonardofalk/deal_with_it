
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deal_with_it/version'

Gem::Specification.new do |spec|
  spec.name          = 'deal_with_it'
  spec.version       = DealWithIt::VERSION
  spec.authors       = ['Leonardo Falk']
  spec.email         = ['leonardo.falk@hotmail.com']

  spec.summary       = 'DealWithIt is a modular exception handler for Ruby applications.'
  spec.homepage      = 'https://github.com/leonardofalk/deal_with_it.git'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'wonder-ruby-style'
end
