Rails.application.routes.draw do
  resources :events
  resources :users
  resources :cities

  root 'homepage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end