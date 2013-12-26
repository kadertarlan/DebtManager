class AddAuthenticationRefToDebts < ActiveRecord::Migration
  def change
    add_column :debts, :authentication_id, :integer
    add_index :debts, :authentication_id
  end
end
