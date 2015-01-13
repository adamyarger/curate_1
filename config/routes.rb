Rails.application.routes.draw do
  root  'static_pages#home'
  # root 'posts#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  resources :posts, only: [:create, :destroy]			#since were only displaying on feed and profile pages = no individual pages 11.3.1
  resources :posts do
  	member do
  		get "like", to: "posts#upvote"
  	end
  end

  # resources :users
  resources :users, only: [:show, :index] # change to resources :users if you want to set up admin

end
