Rails.application.routes.draw do
  root to: "articles#index"
  resources :articles
  devise_for :users
  resources :users, only: %i( show update )
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
