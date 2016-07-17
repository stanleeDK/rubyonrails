
# -- SYNOPSIS --


class User < ActiveRecord::Base
	# has_many :microposts

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	# Rails DOESN'T LIKE att_accessor. You don't need them to define the attributes. You do that using the migrations. 
	# attr_accessor :name, :email, :password, :password_confirmation
	# attr_accessor :remember_token

	# -- These functions ensure that the attributes of the model fulfill these
	# -- requirements otherwise it will populate @user.errors
	validates(:email, {presence: true, uniqueness: true})
	# validates :email, presence: true

	validates(:name, {presence: true, length: {maximum: 30}})
	# validates :name, presence: true, length: {maximum: 10}
	
	validates :password, presence: true, length: { minimum: 3 }
	validates :password_confirmation, presence: true

	# this is a method that comes for free with rails. As long as you did the 
	# password digest migration, then this will map a string password to the hash in the db
	has_secure_password()

	private 
	
	def create_remember_token
#   Because of the way Active Record synthesizes attributes based on database columns, 
# 	without self the assignment would create a local variable called remember_token, 
# 	which isn’t what we want at all. Using self ensures that assignment sets the user’s remember_token 
# 	so that it will be written to the database along with the other attributes when the user is saved.

#  SecureRandom.urlsafe_base64()
#   A custom remember token using the urlsafe_base64 method from the SecureRandom module in the Ruby standard 
#   library, which creates a Base64 string safe for use in URIs (and hence safe for use in cookies as well).
#   3 As of this writing, SecureRandom.urlsafe_base64 returns a random string of length 16 composed of the 
#   characters A–Z, a–z, 0–9, ‘‘-’’, and ‘‘ ’’ (for a total of 64 possibilities). This means that the 
#   probability of two remember tokens being the same is 1/6416 = 2−96 ≈ 10−29, which is negligible.
		self.remember_token = SecureRandom.urlsafe_base64
		puts "hello"
		puts self.remember_token
	end
end
