# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cheerup/version'

Gem::Specification.new do |spec|
  spec.name          = "cheerup"
  spec.version       = Cheerup::VERSION
  spec.authors       = ["Claire Parker"]
  spec.email         = ["claire.parker87@gmail.com"]

  spec.summary       = %q{ Mac's terminal says something to cheer you up. }
  spec.description   = %q{ Mac's say command says something cheery to you, although your Mac isn't as sympathetic as you think. }
  spec.homepage      = 'https://github.com/claireparker/cheer_up'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    fail "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = ['cheer']
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
