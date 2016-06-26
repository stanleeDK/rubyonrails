class User < ActiveRecord::Base
	has_many :microposts

	before_save { |user| user.email = email.downcase }

	#attr_accessible :name, :email 

	
	validates(:email, {presence: true, uniqueness: true})
	# validates :email, presence: true

	validates(:name, {presence: true, length: {maximum: 10}})
	# validates :name, presence: true, length: {maximum: 10}
	

end
