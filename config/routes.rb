Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only:[:create, :destroy]
  end

  resources :users, only: [:show,:index,:edit,:update]


end