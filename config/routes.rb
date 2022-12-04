Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root to: "static_pages#root"
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create, :destroy, :show, :update, :index]
    resource :session, only: [:create, :destroy, :show]
  end
end
