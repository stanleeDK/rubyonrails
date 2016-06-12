module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
	def peppe_pig(user)
		#gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		#logger.debug "#{@user.id}"
		if user.id == 1 
			#puts "hello"
			gravatar_url = "https://upload.wikimedia.org/wikipedia/en/thumb/9/94/George_Pig.png/150px-George_Pig.png" 
			image_tag(gravatar_url, alt: user.name, class: "gravatar")
		elsif user.id == 2
			gravatar_url = "http://blog.seattlepi.com/seattlepolitics/files/2011/05/trump2.jpg" 
			image_tag(gravatar_url, alt: user.name, class: "gravatar")
		end 

	end

end
