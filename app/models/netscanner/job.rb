require "aasm"

class Netscanner::Job < ActiveRecord::Base
  include AASM

  has_many :logs,
           class_name: "Netscanner::Log",
           inverse_of: :jobs

  has_many :credentials_jobs,
           class_name: "Netscanner::CredentialsJob"
  has_many :credentials,
           through: :credentials_jobs,
           class_name: "Metasploit::Credential::Core"

  has_many :hosts_jobs,
           class_name: "Netscanner::HostsJob"
  has_many :hosts,
           through: :hosts_jobs,
           class_name: "Mdm::Host"

  scope :ready_to_start, -> { where(status: :new) }

  before_validation :set_defaults

  validates :name, presence: true
  validates :status, presence: true
  validates :host_ids, presence: true
  validates :credential_ids, presence: true

  aasm column: :status do
    state :new, initial: true
    state :in_progress
    state :successed
    state :error

    event :start do
      transitions from: :new, to: :in_progress
    end

    event :success do
      transitions from: [:new, :in_progress], to: :successed
    end

    event :error do
      transitions from: [:new, :in_progress], to: :error
    end
  end

  def self.search_by_name(query)
    query = "%#{query}%"
    name_match = arel_table[:name].matches(query)
    where(name_match)
  end

  private

  def set_defaults
    self.status ||= "new"
  end
end
