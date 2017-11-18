class RemoveColumnRefundedFromVisits < ActiveRecord::Migration[5.1]
  def change
    remove_column :visits, :refunded
  end
end
