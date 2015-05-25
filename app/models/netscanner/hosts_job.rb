class Netscanner::HostsJob < ActiveRecord::Base
  self.table_name = "netscanner_hosts_jobs"

  belongs_to :host,
             class_name: "Mdm::Host"
  belongs_to :job,
             class_name: "Netscanner::Job"
end
