  Rails.application.routes.draw do
    devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  get "welcome", to: "home#index"
  root to:"home#index"
  get "articles", to: "articles#index"
  get "articles/new", to:"articles#new",  as: :new_articles
  post "articles", to:"articles#create" 
  get "articles/:id", to: "articles#show"
  get "articles/:id/edit", to: "articles#edit"
  patch "articles/:id", to: "articles#update", as: :article
  delete "articles/:id", to:"articles#destroy"
  
end
