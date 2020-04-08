Rails.application.routes.draw do
  resources :estimates, only: [:index, :show, :create]
end
