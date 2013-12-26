class User < ActiveRecord::Base

  has_many :authentications, :foreign_key => :user_id
  has_many :friends
  has_many :debts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:authentication_token
  # attr_accessible :title, :body

  #before_save :ensure_authentication_token
  before_update :ensure_authentication_token
  before_save :skip_confirmation!

  def build_with_provider(omniauth)
    puts omniauth
  	user_info = omniauth['info']
  	provider = omniauth['provider']
  	self.email = user_info['email'].blank? ? "#{rand(190319031903)}@example.net" : user_info['email']
    _password = rand(19031903)
  	self.authentications.build(:provider => provider, :uid => omniauth['uid'], :username => omniauth['info']['name'], :oauth_token => omniauth['credentials'].token, :oauth_token_secret => omniauth['credentials'].secret)
  end

  def password_required?
    super && authentications.blank?
  end


  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def send_confirmation_instructions
    generate_confirmation_token! if self.confirmation_token.nil?
    ::Devise.mailer.delay.confirmation_instructions(self, self.confirmation_token)
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
