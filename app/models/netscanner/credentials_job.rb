class Netscanner::CredentialsJob < ActiveRecord::Base
  belongs_to :credential,
             class_name: "Metasploit::Credential::Core"
  belongs_to :job,
             class_name: "Netscanner::Job"
end
