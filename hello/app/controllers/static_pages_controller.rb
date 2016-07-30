class StaticPagesController < ApplicationController
 
  def home
  	@message = "A message defined inside the controller and sent to the view"
  	  	puts "home page controller method invoked!"
      if signed_in? 
      	 @micropost = current_user.microposts.build
         @feed_items = current_user.feed
         puts "ljkjhkjhkjh-----------------------"
         p @feed_items
         p "Feed Item Count: " + @feed_items.count.to_s
         @feed_items.each do |fe|
          p fe.user
         end
      end 
  end

  def help
  	@message = "A message defined inside the controller and send to the view"
  end
  
  def contactus
  	@message = "A message defined inside the controller and send to the view"
  end

  
end
