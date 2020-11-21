Rails.application.routes.draw do
  devise_for :users
  root to: "books#index" 
  resources :books
  get 'search', to: 'books#search'
end
