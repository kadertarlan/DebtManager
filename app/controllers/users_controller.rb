class UsersController < ApplicationController
	respond_to :html, :json

	def index
		@users = User.all

		respond_with @users
  end

  def update

    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with @user
  end
end
