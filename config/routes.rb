Rails.application.routes.draw do
  resources :boards
  resources :comments, :except => [:index, :show, :edit, :new]  
  get 'shop/yellow'
  get 'shop/blue'
  get 'shop/epic'
  get 'shop/nerd'
  resources :as, path: 'void', :except => [:index, :edit, :new]
  get '/void', to: "pages#void"
  devise_for :users
  root 'pages#home'
  get "/users", to: "pages#users"
  get "/shop", to: "pages#shop"
  resources :u
end
