Rails.application.routes.draw do

  resources :days

  resources :users

  resources :requests

  resources :users, only: [:show] do
    resources :titles, only: [:new, :create, :index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'
  root "application#home"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
