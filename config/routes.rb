Rails.application.routes.draw do
  resources :estimates, only: [:index, :show, :create]

  post '/distance', to: 'distances#create'
end
