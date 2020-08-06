Rails.application.routes.draw do
  root to: 'public#main'
  
  devise_for :accounts
  resources :posts
  resources :properties

  get "/blog" => "posts#latest", as: :blog
  get "/intro" => "intro#index", as: :intro
  
  # admin routes
  get "/public" => "public#main", as: :public
  
  get "/dashboard" => 'dashboard#index', as: :dashboard 
  get "/profile/:id" => 'dashboard#profile', as: :profile 
  post "/agent/message" => "properties#email_agent", as: :email_agent
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
