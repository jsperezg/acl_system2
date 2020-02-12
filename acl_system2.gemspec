# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acl_system2/version'

Gem::Specification.new do |gem|
  gem.name          = 'acl_system2'
  gem.version       = ACLSystem2::VERSION
  gem.authors       = ['Ezra Zygmuntowicz', 'Fabien Franzen', 'Gareth Rees', 'Juan Salvador Pérez']
  gem.email         = ['gareth@garethrees.co.uk', 'jsperezg@gmail.com']
  gem.description   = 'An access control gem for Rails. A flexible declarative way of protecting your various controller actions using roles.'
  gem.summary       = 'An access control gem for Rails'
  gem.homepage      = 'https://github.com/jsperezg/acl_system2'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'minitest', '~> 5.8'
  gem.add_development_dependency 'rake', '~> 13.0.1'
  gem.add_development_dependency 'rubocop'
end
