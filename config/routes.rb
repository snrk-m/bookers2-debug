Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get "/home/about" => "homes#about"
  resources :books
  resources :users, only: [:show, :edit, :update, :index]

  resources :book, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end