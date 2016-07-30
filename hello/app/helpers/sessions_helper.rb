# -- SYNOPSIS --
#   Look in the sessions_controller for a description of how this works and hangs together

module SessionsHelper

def sign_in(user)
	puts "signin() " + user.remember_token.to_s
	cookies.permanent[:remember_token] = user.remember_token
	
	# this line allows the current user to be accessible in the view and the main controller file
	# It uses the assignment operator thanks for the function current_user=() method defined below which
	# does the actual instance variable assignment. @current_user is still the instance variable but
	# you now user current_user= and current_user to set and retrieve it in the view or the controller
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

# This function is called every time a user tries to access an 
#  edit page http://localhost:3000/users/6/edit and asks them to sign in 
def signed_in_user 
  if signed_in? == false
    flash[:success] = "Please sign in!"
    redirect_to(signin_path)
  end
end

def sign_out
	self.current_user = nil
	cookies.delete(:remember_token)
end

def current_user=(user)
	@current_user = user 
end

def current_user?(user)
	if user == @current_user
		true
	else
		false
	end
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
