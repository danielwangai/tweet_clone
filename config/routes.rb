Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users
  
  resources :tweets do
    resources :retweets
  end
  
end
