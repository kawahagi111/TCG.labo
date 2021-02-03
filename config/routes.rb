Rails.application.routes.draw do
  devise_for :users
  root to: "games#show"
  resources :tweets do
    resources :comments, only: [:create]
  end

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

 get "users/:id/likes" => "users#likes", as: 'like'

  resources :users, only: [:show] 
  resources :games, only: [:show]

end
