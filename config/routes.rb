Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "categories#index"

  get '/welcome', to: 'categories#splash', as: 'welcome'

  resources :categories, only: %i[index]
  resources :users, only: %i[index]
  # root "home#index"
end
