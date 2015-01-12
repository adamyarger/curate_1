Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  resources :posts, only: [:create, :destroy]			#since were only displaying on fee and profile pages = no individual pages 11.3.1
  resources :posts do
  	member do
  		get "like", to: "posts#upvote"
  	end
  end

  # resources :users
  resources :users, only: [:show, :index]

  root 'posts#index'
end
