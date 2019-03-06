Rails.application.routes.draw do
  resources :events
  resources :users
  resources :cities

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy', as: :logout
  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'

  root 'homepage#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
