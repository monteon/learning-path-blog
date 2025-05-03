class CreateSolidQueueTables < ActiveRecord::Migration[8.0]
  def change
    create_table :solid_queue_jobs do |t|
      t.string :queue_name, null: false
      t.string :job_class, null: false
      t.jsonb :arguments, null: false, default: []
      t.datetime :scheduled_at
      t.datetime :performed_at
      t.datetime :finished_at
      t.integer :priority, null: false, default: 0
      t.integer :attempts, null: false, default: 0
      t.timestamps
    end

    add_index :solid_queue_jobs, :queue_name
    add_index :solid_queue_jobs, :scheduled_at
  end
end
