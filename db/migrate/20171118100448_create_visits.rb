class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.datetime :visit_date
      t.boolean :refunded
      t.bigint :patient_id
      t.bigint :doctor_id

      t.timestamps
    end
  end
end
