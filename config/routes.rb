Rails.application.routes.draw do
  # resources :users
  # resources :locations
   root 'users#index'


resources :users do
  resources :locations
end


 namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :locations
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
