class User < ActiveRecord::Base
	# has_many :microposts

	before_save { |user| user.email = email.downcase }

	# Rails DOESN'T LIKE att_accessor. You don't need them to define the attributes. You do that using the migrations. 
	# attr_accessor :name, :email, :password, :password_confirmation

	validates(:email, {presence: true, uniqueness: true})
	# validates :email, presence: true

	validates(:name, {presence: true, length: {maximum: 30}})
	# validates :name, presence: true, length: {maximum: 10}
	
	validates :password, presence: true, length: { minimum: 3 }
	validates :password_confirmation, presence: true

	# this is a method that comes for free with rails. As long as you did the 
	# password digest migration, then this will map a string password to the hash in the db
	has_secure_password()
end
