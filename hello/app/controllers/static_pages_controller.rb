class StaticPagesController < ApplicationController
  def home
  end

  def help
  	@message = "How can we help you?"
  end
end
