Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books do
    resources :users,only: [:show,:index,:edit,:update]
    resource :favorites,only: [:create, :destroy]
  end
end