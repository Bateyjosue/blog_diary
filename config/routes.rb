Rails.application.routes.draw do
  get 'users/', to: 'users#index'
  get 'users/:id', to: 'users#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #create route for posts for  a users
  get 'users/:id/posts', to: 'posts#index'
  get 'users/:id/posts/:post_id', to: 'posts#show'

  #create controller for posts for  a users
  #rails g controller posts index show



end
