Rails.application.routes.draw do
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  root "pages#home"
  resources :articles    #This will provide all the RestFul routes for the articles
  get '/home', to: "pages#home"
  get '/about', to: "pages#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
