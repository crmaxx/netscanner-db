#
# Gems
#
# gems must load explicitly any gem declared in gemspec
# @see https://github.com/bundler/bundler/issues/2018#issuecomment-6819359
#

require 'netscan/version'

require 'metasploit/concern'
require 'metasploit_data_models'
require 'metasploit/model'
require 'metasploit/credential'

module Netscan
  class Engine < ::Rails::Engine
    isolate_namespace Netscan
  end

  extend ActiveSupport::Autoload

  autoload :CredentialsJob
  autoload :HostsJob
  autoload :Job
  autoload :Log

  def self.table_name_prefix
    'netscanner_'
  end
end
