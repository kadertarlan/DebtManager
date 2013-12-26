class Debt < ActiveRecord::Base
  	attr_accessible :amount, :deadline, :from
	belongs_to :user
	validates :amount, :presence => true, :numericality => {:greater_than => 0}
	validates :amount, :presence => true
end
