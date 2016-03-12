class StaticPagesController < ApplicationController
 
  def home
  	@message = "A message defined inside the controller and sent to the view"
  end

  def help
  	@message = "A message defined inside the controller and send to the view"
  end
  
  def contactus
  	@message = "A message defined inside the controller and send to the view"
  end
end
