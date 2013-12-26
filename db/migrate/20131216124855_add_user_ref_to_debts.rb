class AddUserRefToDebts < ActiveRecord::Migration
  def change
    add_column :debts, :user_id, :integer
    add_index :debts, :user_id
  end
end
