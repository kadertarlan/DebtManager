class DeleteAuthenticationId < ActiveRecord::Migration
  def change
  	remove_column :authentications, :authentications_id, :integer
  end
end
