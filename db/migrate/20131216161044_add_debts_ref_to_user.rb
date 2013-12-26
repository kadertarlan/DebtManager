class AddDebtsRefToUser < ActiveRecord::Migration
  def change
  	add_column :users, :debt_id, :integer
    add_index :users, :debt_id
  end
end
