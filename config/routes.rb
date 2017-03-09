Rails.application.routes.draw do

  root 'welcome#index'

  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'

  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :ownerships, only: [:create, :destroy]
  resources :items , only: [:new , :show]
    resources :users do
    member do
      get 'followings' , 'followers'
    end
  end
end
