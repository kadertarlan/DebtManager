class Friend < ActiveRecord::Base
  attr_accessible :authentication_id, :name, :surname, :twitterUsername, :email
  belongs_to :user
  validates :name, :presence => true
  validates :email, :presence => true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :twitterUsername, :presence => true
end
