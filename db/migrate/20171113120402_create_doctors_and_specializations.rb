class CreateDoctorsAndSpecializations < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors_specializations, id: false do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :specialization, index: true
    end
  end
end
