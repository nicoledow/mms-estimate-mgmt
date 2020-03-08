Rails.application.routes.draw do

  resources :estimates, only: [:index, :create]
end
