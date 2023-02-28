Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
