$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'netscan/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'netscanner-db'
  s.version     = Netscan::VERSION
  s.authors     = ['Maxim Zhukov']
  s.email       = ['crmaxx@gmail.com']
  s.homepage    = 'https://github.com/crmaxx/netscanner-db'
  s.license     = 'BSD-3-clause'
  s.summary     = 'Models for Netscanner and Metasploit Pro'
  s.description = 'The Netscanner namespace and its ActiveRecord::Base subclasses'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['Rakefile']
  s.require_paths = %w{app/models lib}

  s.required_ruby_version = '>= 2.1'

  s.add_runtime_dependency 'aasm'

  rails_version_constraints = ["< 4.0.0", ">= 3.2.21"]

  s.add_runtime_dependency 'activerecord', *rails_version_constraints
  s.add_runtime_dependency 'activesupport', *rails_version_constraints
  s.add_runtime_dependency 'railties', *rails_version_constraints

  s.add_runtime_dependency 'metasploit-concern', '~> 0.5.0'
  s.add_runtime_dependency 'metasploit-model', '~> 0.30.2'
  s.add_runtime_dependency 'metasploit_data_models', '~> 0.24.0'
  s.add_runtime_dependency 'metasploit-credential', '~> 0.14.7'

  if RUBY_PLATFORM =~ /java/
    s.add_runtime_dependency 'jdbc-postgres'
    s.add_runtime_dependency 'activerecord-jdbcpostgresql-adapter'

    s.platform = Gem::Platform::JAVA
  else
    s.add_runtime_dependency 'pg'

    s.platform = Gem::Platform::RUBY
  end
end
