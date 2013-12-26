class Authentication < ActiveRecord::Base
	belongs_to :user
  	attr_accessible :user_id, :provider, :uid, :username, :oauth_token, :oauth_token_secret
end
