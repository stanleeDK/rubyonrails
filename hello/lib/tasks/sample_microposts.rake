# SYNOPSIS - 
# Run this command to execute this rake script 
# bundle exec rake db:populate2

namespace :db do
	
	desc "Fill database with sample data" 
	
	task populate2: :environment do

		# Micropost.create!(user_id: 6, content: "hello world")
	
		users = User.limit(50) 
		# p users	
		
		50.times do
	      	content = Faker::Lorem.sentence(5)
			users.each { |user| 
				user.microposts.create!(content: content) 
			} 
		end
	end 
end