Rails.application.routes.draw do

  resources :estimates, only: [:index, :show, :create]

  get '/google/sheets', to: 'application#google_sheets_auth'
  
  post '/distance', to: 'distances#create'
end
