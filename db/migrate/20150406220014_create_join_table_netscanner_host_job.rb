class CreateJoinTableNetscannerHostJob < ActiveRecord::Migration
  def change
    create_table "netscanner_hosts_jobs", id: false, force: true do |t|
      t.integer "host_id", null: false
      t.integer "job_id", null: false
    end
    add_index :netscanner_hosts_jobs, [:host_id, :job_id]
    add_index :netscanner_hosts_jobs, [:job_id, :host_id]
  end
end
