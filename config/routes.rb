Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end

  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:index, :create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  get '/search' => 'search#search'


end