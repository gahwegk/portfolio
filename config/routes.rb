Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'

  resources :users, only: [:index, :show, :edit, :update]
  resources :reviews, only:[:index, :show, :edit, :new, :create, :update, :destroy]
end
