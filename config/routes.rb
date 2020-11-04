Rails.application.routes.draw do
  devise_for :users
  root to: "books#index" 
  resources :books, only: [:new, :create,:edit,:update,:destroy,:show]
end
