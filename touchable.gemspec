# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'touchable/version'

Gem::Specification.new do |spec|
  spec.name          = "touchable"
  spec.version       = Touchable::VERSION
  spec.authors       = ["Artur Pañach"]
  spec.email         = ["arturictus@gmail.com"]

  spec.summary       = %q{Cascading touch for active model}
  spec.description   = %q{Cascading touch for active model. Very usefull for Russian Doll cache strategies}
  spec.homepage      = "https://github.com/arturictus/touchable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'activemodel', '~> 4.2'
  spec.add_dependency 'activesupport', '~> 4.2'
end
