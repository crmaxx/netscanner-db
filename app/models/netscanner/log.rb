class Netscanner::Log < ActiveRecord::Base
  belongs_to :job,
             class_name: "Netscanner::Job",
             inverse_of: :logs

  belongs_to :host,
             class_name: "Mdm::Host",
             inverse_of: :logs
end
