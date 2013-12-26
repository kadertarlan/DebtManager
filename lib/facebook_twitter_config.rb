module FacebookTwitterConfig
	def send_tweet(twitter_user, message)

		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "xCglGtp1gF08epsdW59iA"
		  config.consumer_secret     = "ujGzCG0MXwbrel7Xiao3B3q1eRy4Izo2LzRgCO0Hk"
		  config.access_token        = twitter_user.oauth_token
		  config.access_token_secret = twitter_user.oauth_token_secret
		end

		client.update(message)
	end

	def send_post(facebook_user, message)
		me = FbGraph::User.me(facebook_user.oauth_token)
		me.feed!(
		  :message => message
		)
	end

end