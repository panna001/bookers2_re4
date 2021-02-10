Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  get 'home/top'
  get 'home/about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
