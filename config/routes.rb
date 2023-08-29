Rails.application.routes.draw do
  resources :posts
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :rooms do
    get 'direct_message/:user_id', to: 'users#direct_message', on: :collection, as: :direct_message
    resources :messages
  end


  # Defines the root path route ("/")
  root 'home#index'
  post 'toggle_like', to: 'likes#toggle_like', as: :toggle_like
  resources :comments, only: %i[create destroy]
  resources :users, only: %i[show index]

  post "follow", to: "follows#follow", as: :follow
  delete "unfollow", to: "follows#unfollow", as: :unfollow
  delete "cancel_req", to: "follows#cancel_request", as: :cancel_request

  post "accept_follow", to: "follows#accept_follow", as: :accept_follow
  delete "decline_follow", to: "follows#decline_follow", as: :decline_follow
end
