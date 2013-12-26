class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def omniauth_create(omniauth)
		authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
		if authentication.present?
			sign_in_and_redirect(:user, authentication.user)
		elsif current_user

			authentication = current_user.build_with_provider(omniauth)
			authentication.save
			redirect_to authentications_url
		else
			user = User.find_by_email(omniauth['info']['email']) || User.new
			user.build_with_provider(omniauth)
			if user.save
				flash[:notice] = "Sign in successful"
				sign_in_and_redirect(:user, user)
			end
		end
	end

	def facebook
		omniauth_create(request.env["omniauth.auth"])
	end
	def twitter
		omniauth_create(request.env["omniauth.auth"])
	end
end