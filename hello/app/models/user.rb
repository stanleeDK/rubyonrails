class User < ActiveRecord::Base
	# has_many :microposts

	# before_save { |user| user.email = email.downcase }

	# RUBY DOESN'T LIKE att_accessor. You don't need them to define the attributes. You do that using the migrations. 
	# attr_accessor :name, :email, :password, :password_confirmation

	validates(:email, {presence: true, uniqueness: true})
	# validates :email, presence: true

	validates(:name, {presence: true, length: {maximum: 10}})
	# validates :name, presence: true, length: {maximum: 10}
	
	validates :password, presence: true, length: { minimum: 3 }
	validates :password_confirmation, presence: true

	has_secure_password()
end
