Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  resources :posts do
  	member do
  		get "like", to: "posts#upvote"
  	end
  end

  root 'posts#index'
end
