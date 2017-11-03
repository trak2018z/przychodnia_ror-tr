class AddCustomFieldsToDoctors < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :name, :string, null: false
    add_column :doctors, :phone, :string
    add_column :doctors, :admin, :boolean, null: false, default: "false"
  end
end
