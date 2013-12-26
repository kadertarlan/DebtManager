class ApplicationController < ActionController::Base
  before_filter :authenticate_user_from_token!
  # This is Devise's authentication
  def after_sign_in_path_for(resource)
    # Check out which one is better

    # this part takes a url(bilmemne_url might work), don't use redirect_to
    return user_debts_path(current_user)

    # rails understands that user_path stands for /users/:id
    # return user_path
  end
  private

  # For this example, we are simply using token authentication
  # via parameters. However, anyone could use Rails's token
  # authentication features to get the token from a header.
  def authenticate_user_from_token!
    user_token = params[:auth_token].presence
    user       = user_token && User.find_by_authentication_token(user_token.to_s)

    if user
      # Notice we are passing store false, so the user is not
      # actually stored in the session and a token is needed
      # for every request. If you want the token to work as a
      # sign in token, you can simply remove store: false.
      sign_in user, store: false
    end
  end

end
