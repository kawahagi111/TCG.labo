Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "tweets#index"
  resources :tweets, only: [:index, :create, :new]
end
