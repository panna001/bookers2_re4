Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  get 'home/about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :destoy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
