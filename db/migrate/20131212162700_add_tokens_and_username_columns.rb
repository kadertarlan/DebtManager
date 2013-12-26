class AddTokensAndUsernameColumns < ActiveRecord::Migration
  def change
    add_column :authentications, :oauth_token, :string
    add_column :authentications, :oauth_token_secret, :string
    add_column :authentications, :username, :string
  end
end
