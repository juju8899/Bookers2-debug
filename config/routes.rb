Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root to: "homes#top"
  get "home/about"=>"homes#about"
  devise_for :users
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'following_user' => 'users#following_user', as: 'following_user'
    get 'follower_user' => 'users#follower_user', as: 'follower_user'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end