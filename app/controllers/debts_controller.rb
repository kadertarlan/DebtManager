class DebtsController < ApplicationController
  include FacebookTwitterConfig
  before_filter :authenticate_user!
  before_filter :find_user


  respond_to :html, :json
  # GET /debts
  # GET /debts.json
  def find_user
    @user = current_user || User.find(params[:user_id])
  end

  def send_post_twitter
    @debt = Debt.find(params[:id])
    twitter_user = current_user.authentications.where(:provider => "twitter").first

    if twitter_user
      message = "#{@debt.from} does not give my $#{@debt.amount} from #{@debt.deadline.to_s}"
      
      self.send_tweet(twitter_user,message)
      
      respond_to do |format|
        format.html  { redirect_to [@user, @debt], notice: 'Post send from Twitter.' }
        format.json { render json: @debt, status: :created, location: @debt }
      end
    else
      flash[:error] = "Twitter hesabiyla girmemis panpa"
      redirect_to [@user, @debt]
    end
  end

  def send_post_facebook
    @debt = Debt.find(params[:id])
    facebook_user = current_user.authentications.where(:provider => "facebook").first
    message = "#{@debt.from} does not give my $#{@debt.amount} from #{@debt.deadline.to_s}"
    
    self.send_post(facebook_user, message)
    
    respond_to do |format|
      format.html  { redirect_to [@user, @debt], notice: 'Post send from Facebook.' }
      format.json { render json: @debt, status: :created, location: @debt }
    end
  end
  
  def index

    @debts = Debt.where(:user_id => @user.id)
    respond_with @debts
  end

  # GET /debts/1
  # GET /debts/1.json
  def show
    @debt = Debt.find(params[:id])

    respond_with @debt
  end

  # GET /debts/new
  # GET /debts/new.json
  def new
    @debt = @user.debts.build
  end

  # GET /debts/1/edit
  def edit
    @debt = Debt.find(params[:id])
  end

  # POST /debts
  # POST /debts.json
  def create
    @debt = @user.debts.build(params[:debt])
    @debt.save
    respond_with [@user, @debt]
  end

  # PUT /debts/1
  # PUT /debts/1.json
  def update
    @debt = Debt.find(params[:id])
    @debt.update_attributes(params[:debt])
    respond_with(@user, @debt)
  end

  # DELETE /debts/1
  # DELETE /debts/1.json
  def destroy
    @debt = Debt.find(params[:id])
    @debt.destroy

  end
end
