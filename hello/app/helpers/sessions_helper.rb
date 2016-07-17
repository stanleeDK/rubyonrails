# -- SYNOPSIS --
#   Look in the sessions_controller for a description of how this works and hangs together

module SessionsHelper

def sign_in(user)
	puts "signin() " + user.remember_token.to_s
	cookies.permanent[:remember_token] = user.remember_token
	
	# this line allows the current user to be accessible in the view and the main controller file
	# It uses the assignment operator thanks for the function current_user=() method defined below which
	# does the actual instance variable assignment. 
	self.current_user = user 
end

def signed_in?
	puts "signed_in()"
	# !current_user.nil?
	if current_user != nil
		true
	else
		false
	end
	
end 

def sign_out
	self.current_user = nil
	cookies.delete(:remember_token)
end

def current_user=(user)
	@current_user = user 
end

# return the current user. To do so, it finds the current user via the token in the db (via the active record find_by method)
# but only if the current user is nil. Otherwise return current_user if it's already set 
def current_user 
	puts "current_user() looking for user"
	puts "Cookie " + cookies[:remember_token].to_s
	if cookies[:remember_token] != nil
		puts "gotcha"
		# this ||= syntax will set the current_user to a user found by the method, else if alredy found it will just return the current instance
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	p @current_user
end 



end
