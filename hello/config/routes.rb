Rails.application.routes.draw do

# -- Routes Synopsis -- 
# Rails automatically generates helper methods for you which correspond to the 
# names of all your routes. These methods end with _path and _url
# This means you can use methods like this: <li><%= link_to "Sign Up", new_user_path %></li>

# Use "rake routes" in the terminal to show all the routes rails has for you 
# For example:
#    sessions    POST   /sessions(.:format)            sessions#create
#    new_session GET    /sessions/new(.:format)        sessions#new
#    session     DELETE /sessions/:id(.:format)        sessions#destroy

  
# the "resources()" This automatically creates 7 paths for you which 
# map to the http verbs. 
  resources :users

#just demonstrating how to invoke it with or without brackets, and limiting the automatic routes to crreat and destroy 
  resources(:microposts, only: [:create, :destroy]) 
# the :microposts resources line above creates the following routes:
# create = POST = /microposts 
# destroy = microposts/1 

  
# Limiting the routes which map to methods of the sessions controller to only 
# GET -> new (aka signin_path) (HTTP verb, controller method, rails auto-generated method)
# POST -> create (aka new_sessions_path)
# DELETE -> destroy (aka signout_path)
  
  resources(:sessions, {:only => [:new,:create,:destroy]}) 
  #resources :sessions, :only => [:new, :create, :destroy] # a less verbose waht to write this. 
  #resources :sessions, only: [:new,:create,:destroy] #even less verbose way. 



  root             'static_pages#home'
  get 'help'      => 'static_pages#help'
  get 'about'     => 'static_pages#about'
  # get 'contactus' => 'static_pages#contactus'
  
  get 'testrender'=> 'users#testrender'

  get 'signup'    => 'users#new' #seems the same as match /signup... why? 
  get 'signin'    => 'sessions#new' #this is just a custom version of new_session (aka new_session_path aka sessions#create)
  delete 'signout' => 'sessions#destroy'

# -- match has been deprecated, but is another way. You need to pass in the http verb to make it work using the via symbol
# match '/signup', to: 'users#new', :via => [:get]
# match '/signin', to: 'sessions#new', :via => [:get]
# match '/signout', to: 'sessions#destroy', :via => [:delete]



  # -- example of difference ways to direct requests to controllers and the methods within them 
  #root 'application#hello'
  #root "users#index"
  #root "microposts#index"

  
  # -- Example of creating routes for static pages 
  #get 'static_pages/home'
  # get 'static_pages/help'
  # get 'static_pages/contactus'




end

