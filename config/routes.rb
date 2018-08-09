Rails.application.routes.draw do

  resources :days

  resources :users do
    resources :titles
  end

  resources :requests

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'
  root "application#home"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
