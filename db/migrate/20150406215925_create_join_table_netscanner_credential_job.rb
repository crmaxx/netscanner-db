class CreateJoinTableNetscannerCredentialJob < ActiveRecord::Migration
  def change
    create_table "netscanner_credentials_jobs", id: false, force: true do |t|
      t.integer "credential_id", null: false
      t.integer "job_id", null: false
    end
    add_index :netscanner_credentials_jobs, [:credential_id, :job_id]
    add_index :netscanner_credentials_jobs, [:job_id, :credential_id]
  end
end
