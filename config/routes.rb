Rails.application.routes.draw do

  root to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :estimates, only: [:index, :show, :create]
end
