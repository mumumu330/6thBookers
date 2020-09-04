Rails.application.routes.draw do
  get 'books/top'
  get 'home/about'
  get 'books/edit'
  get 'search/search', as: 'search'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'follower' => 'users#follower'
    get 'followed' => 'users#followed'
  end

  root 'books#top'

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す


end