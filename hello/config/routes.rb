Rails.application.routes.draw do

  
  root             'static_pages#home'
  get 'help'      => 'static_pages#help'
  get 'about'     => 'static_pages#about'
  get 'contactus' => 'static_pages#contactus'

  #example of difference ways to direct requests to controllers and the methods within them 
  #root 'application#hello'
  #root "users#index"
  #root "microposts#index"

  
  # Example of creating routes for static pages 
  #get 'static_pages/home'
  # get 'static_pages/help'
  # get 'static_pages/contactus'

  resources :microposts
  resources :users

end
