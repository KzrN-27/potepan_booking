Rails.application.routes.draw do
  get 'rooms/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :edit, :update]
  get "users/:id/account" => "users#account", as: :account
  get "users/:id/profile" => "users#profile", as: :profile
  get "users/:id/confirm" => "users#confirm", as: :confirm
  post "users/:id/pass" => "users#pass", as: :pass
  resources :sessions, only: [:new, :create, :destroy]
  resources :rooms, only: [:new, :create, :show, :index]
end
