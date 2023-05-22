Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'

  resources :companies do
    resources :customers do
      resources :invoices do
        resources :products
        resources :delivery_addresses
      end
    end
  end
end
