Rails.application.routes.draw do
  get 'messages/index'
  root to: "tweets#index"
  resources :tweets, only: [:index]
end
