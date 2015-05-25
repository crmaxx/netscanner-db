class Netscanner::HostsJob < ActiveRecord::Base
  belongs_to :host,
             class_name: "Mdm::Host"
  belongs_to :job,
             class_name: "Netscanner::Job"
end
