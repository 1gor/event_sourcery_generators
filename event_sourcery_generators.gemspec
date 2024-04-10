# frozen_string_literal: true

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'event_sourcery_generators/version'

Gem::Specification.new do |spec|
  spec.name = 'event_sourcery_generators'
  spec.version = EventSourceryGenerators::VERSION
  spec.authors = ['Sebastian von Conrad', 'Pablo Lee', 'Chun-wei Kuo', 'Giancarlo Salamanca', 'Igor Drozdov']
  spec.email = ['sebastian.von.conrad@envato.com', 'pablo.lee@envato.com', 'chun.wei.kuo@envato.com', 'giancarlo.salamanca@envato.com', 'igor@drozdov.net']

  spec.summary       = 'Generators for EventSourcery'
  spec.description   = 'An opinionated CLI tool for building event-sourced Ruby services with EventSourcery'
  spec.homepage      = 'https://github.com/1gor/event_sourcery_generators'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 1.3'
  spec.add_dependency 'activesupport', '~> 7.1'
  spec.add_dependency 'verbs', '~> 3.1'
  spec.add_development_dependency 'bundler', '~> 2.5'
  spec.add_development_dependency 'rake', '~> 13.2'
  spec.add_development_dependency 'rspec', '~> 3.13'
end
