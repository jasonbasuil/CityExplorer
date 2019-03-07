Rails.application.routes.draw do
  resources :events
  resources :users
  resources :cities
  resources :rsvps

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy', as: :logout
  
  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'

  get '/events/home', to: 'users#home'

  root 'homepage#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
