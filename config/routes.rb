Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users
  
  resources :tweets do
    resources :retweets
  end

  resources :users do
  	member do
     	  get :following, :followers
  	end
  end

  resources :relationships
  
end
