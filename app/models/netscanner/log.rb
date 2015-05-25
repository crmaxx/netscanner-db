class Netscanner::Log < ActiveRecord::Base
  self.table_name = "netscanner_logs"

  belongs_to :job,
             class_name: "Netscanner::Job",
             inverse_of: :logs

  belongs_to :host,
             class_name: "Mdm::Host",
             inverse_of: :logs
end
