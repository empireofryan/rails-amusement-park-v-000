Rails.application.routes.draw do

  resources :users

  root "home#index"

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/signout', to: "sessions#destroy"
end