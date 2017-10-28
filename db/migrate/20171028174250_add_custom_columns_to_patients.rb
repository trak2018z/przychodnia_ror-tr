class AddCustomColumnsToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :name, :string, null:false
    add_column :patients, :age, :integer, null:false
    add_column :patients, :pesel, :string, null:false
    add_column :patients, :phone, :string, null:false
    add_column :patients, :address, :string, null:false
  end
end
