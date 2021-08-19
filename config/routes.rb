Rails.application.routes.draw do
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  root "pages#home"
  resources :articles    #This will provide all the RestFul routes for the articles
  get '/about', to: "pages#about"
  get '/signup', to: "users#new"
  resources :users, except: [:new]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
