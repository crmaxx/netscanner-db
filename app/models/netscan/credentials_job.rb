class Netscan::CredentialsJob < ActiveRecord::Base
  belongs_to :credential,
             class_name: "Metasploit::Credential::Core"
  belongs_to :job,
             class_name: "Netscan::Job"
end
