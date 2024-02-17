Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    root to: 'toppages#index'
  
  get '/login', to: 'toppages#login'
  get 'login/creator', to: 'sessions#new'
  post 'login/creator', to: 'sessions#create'

  get 'login/editor',  to: 'sessions#editornew'
  post 'login/editor', to: 'sessions#editorcreate'
  get 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  get 'signup_0', to: 'users#new'
  get 'profile', to: 'users#show'

  
  get 'mypage', to: 'works#show'
  get 'mypage/edit', to: 'works#edit'
  
  get 'inquiry', to: 'inquiry#index'
  

  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  
  resources :works, only: [:show, :create, :edit, :destroy]

  resources :genres 
end
