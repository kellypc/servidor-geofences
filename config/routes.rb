Rails.application.routes.draw do
  devise_for :users

	root 'geofences#index'
  
  resources :geofences
end
