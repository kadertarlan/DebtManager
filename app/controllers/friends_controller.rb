class FriendsController < ApplicationController
  # GET /friends
  # GET /friends.json
  before_filter :find_user

  def find_user
    @user = User.find(params[:user_id])
  end
  respond_to :html, :json

  def index
    @friends = Friend.where(:user_id => @user.id)
    
    respond_with @friends
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    @friend = Friend.find(params[:id])

    respond_with @friend
  end

  # GET /friends/new
  # GET /friends/new.json
  def new
    @friend = @user.friends.build
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find(params[:id])
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = @user.friends.build(params[:friend])
    @friend.save
    respond_with [@user, @friend]
  end

  # PUT /friends/1
  # PUT /friends/1.json
  def update
    @friend = Friend.find(params[:id])
    @friend.update_attributes(params[:friend])
    respond_with(@user, @friend)
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
  end
end
