Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'
  namespace :api do
    namespace :v1 do
      resources :libraries,only: [] do
        member do
          get :books
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
