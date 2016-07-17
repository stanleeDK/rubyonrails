
# -- SYNOPSIS -- How to create the experience of a logged on user
#    Our desired authentication method is to place a remember token as a cookie on the user’s browser, and then use the token to find the user record in the database as the user moves from page to page 
# 1. Create a session controller using the rails command 
# 2. Add resources to the routes file for the sessions object/model
# 3. Create methods in the controller (e.g. new, create, destroy) which map to http verbs 
# 4. Create a view that will render if the new method in the controller is invoked 
# 5. Create a create method that will handle the post request from the view 
# 6. Now you need to actually recognize that a user is logged in. To do this you will go back to the 
# 	 User model and for each user generate a random string (eventually it will become the cookie) to represent a logged on state using a s
# 	 standard ruby library SecureRandom. Hook that function up to the save event before_save() so it will be invoked everytime a user is created
# 7. Create a spot in the db / users table for the token/random string using a migration: rails generate migration add remember token to users
# 8. Now you can write some helper methods in sessions_helper.rb which you include in your application controller file so it's global. Since it's global you can access it in the user controler and the views too
#     This has two main methods, sign_in and signed_in which will sign a user in by setting a cookie containing it's remember_token
#     The other method is invoked in every view (via the _header partial), and checks if the current_user attribute is null or not.
#     It also holds some code with allows the instance variable @current_user to be set and retrieved 	

class SessionsController < ApplicationController

	# invoked via the routes file where /signin in mapped to this method 
	def new
	end

	# this method is the logon function which the sign in form posts to
	# it will find the user and authenticate 
	# maps to the post http verb by default. You will accept post requests from the /signin page 
	def create

		# Because the post method in the form maps to this method, the params object has all the attributes needed
		# p params[:session]
		# p params[:session][:email]
		# p params[:session][:password]

		user = User.find_by_email(params[:session][:email])
		# p user
		if user && user.authenticate(params[:session][:password])
			sign_in(user)
			redirect_to user

		else 
			flash.now[:success] = "Invalid Credentials!"
			render :new
			# -- Examples of what you can do after an invalid password has been provided
			# render file: "static_pages/invalidlogin.html"  
			# render ({:text =>"Invalid"}) # a more verbose way to write it, as you're passing an object
			# render text: "Invalid"
		end
	end

	def destroy
		puts "signout()"
		sign_out()
		redirect_to(root_path)
	end

end
