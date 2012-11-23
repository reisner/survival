# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'survival/version'

Gem::Specification.new do |gem|
  gem.name          = "Survival"
  gem.version       = Survival::VERSION
  gem.authors       = ["Roman Eisner"]
  gem.email         = ["ithmatic@gmail.com"]
  gem.description   = %q{A gem that provides survival analysis functionality}
  gem.summary       = %q{Kaplan-Meier Estimation}
  gem.homepage      = "https://github.com/reisner/survival"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
