Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  root :to => 'lists#index'

  resources :lists do
    resources :tasks, :except => [:show, :index]
  end

  resources :users
  resources :sessions
end
