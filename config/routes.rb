Rails.application.routes.draw do
  resources :events
  resources :users
  resources :cities
  resources :rsvps

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/users/new', to: 'sessions#new'
  post '/users/new', to: 'sessions#create'

  delete '/login', to: 'sessions#destroy', as: :logout
  delete '/logout', to: 'sessions#destroy'

  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'

  get '/events/home', to: 'users#home'
  #delete '/events', to: 'events#destroy', as: :delete_event

  root 'homepage#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
