class Netscanner::CredentialsJob < ActiveRecord::Base
  self.table_name = "netscanner_credentials_jobs"

  belongs_to :credential,
             class_name: "Metasploit::Credential::Core"
  belongs_to :job,
             class_name: "Netscanner::Job"
end
