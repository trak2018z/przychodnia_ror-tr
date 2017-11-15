class CreateWorktimes < ActiveRecord::Migration[5.1]
  def change
    create_table :worktimes do |t|
      t.string :weekday
      t.time :start_time
      t.time :end_time
      t.bigint :doctor_id

      t.timestamps
    end
  end
end
