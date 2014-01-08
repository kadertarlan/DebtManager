require 'spec_helper'

describe FriendsController do

    before do
      @user = FactoryGirl.create(:user)
      sign_in :user, @user
      @friend = FactoryGirl.create(:friend, :user => @user)
    end

    it "should get all his friends" do
      get :index, :user_id => @user.id
      assigns(:friends).should include(@friend)
      response.status.should be(200)
    end
    # it "should not get someone elses friends" do
    #   get :index, :user_id => @user.id
    #   assigns(:friends).should_not include(@friend2)
    #   response.status.should be(200)
    # end

    it "should get his friend" do
      get :show, :id => @friend.id, :user_id => @user.id
      response.should render_template 'show'
      assigns(:friend).should eq(@friend)
      response.status.should be(200)
    end
    it "should not get someone elses friend" do
      get :show, :id => @friend2.id, :user_id => @user.id
      response.should_not render_template 'show'
      response.status.should be(302)
    end

    it "should get new friend page" do
      get :new, :id => @friend.id, :user_id => @user.id
      response.should render_template 'new'
      response.status.should be(200)
    end
    it "should get edit page for his friend" do
      get :edit, :id => @friend.id, :user_id => @user.id
      response.should render_template 'edit'
      response.status.should be(200)
    end
    # it "should create a new friend" do
    #   post :create, :friend => {:name => "merhaba"}, :user_id => @user.id
    #   Friend.last.name.should == "merhaba"
    #   flash[:notice].should == "Friend was successfully created."
    #   response.status.should be(302)
    # end
    it "should update his friend" do
      put :update, :friend => {:name => "Updated friend"}, :id => @friend.id, :user_id => @user.id
      t = Friend.find(@friend)
      t.name.should == "Updated friend"
      response.status.should be(302)
    end
    # it "should delete his friend" do
    #   delete :destroy, :id => @friend.id, :user_id => @user.id
    #   f = Friend.unscoped.find(@friend)
    #   f.deleted_at.should_not be_nil
    #   flash[:notice].should == "Friend was successfully deleted."
    #   response.status.should be(302)
    # end
  end
