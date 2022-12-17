Rails.application.routes.draw do
  get 'likes/create'
  get 'comments/create'

  root 'users#index'

  # get 'users/', to: 'users#index'
  # get 'users/:id', to: 'users#show', as: 'user'
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Defines the root path route ("/")
  # # root "articles#index"

  # #create route for posts for  a users
  # get 'users/:id/posts', to: 'posts#index', as: 'user_posts'
  # get 'users/:id/posts/:post_id', to: 'posts#show', as: 'user_post'

  #create controller for posts for  a users
  #rails g controller posts index show

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
end
