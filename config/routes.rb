Rails.application.routes.draw do
  get 'rooms/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  get "users/account"
end
