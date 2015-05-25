class CreateNetscannerLogsTable < ActiveRecord::Migration
  def change
    create_table :netscanner_logs do |t|
      t.integer :workspace_id, default: 1, null: false
      t.integer :job_id, null: false
      t.integer :host_id, null: false
      t.text :message

      t.timestamps null: false
    end
    add_index :netscanner_logs, :workspace_id
    add_index :netscanner_logs, :job_id
    add_index :netscanner_logs, :host_id
  end
end
