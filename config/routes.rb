Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/about", to: "pages#about"
  get "/requests", to: "purchases#requests"
  get "/purchases/:id/accept", to: "purchases#accept", as: "purchase_accept"
  get "/purchases/:id/reject", to: "purchases#reject", as: "purchase_reject"

  get "/coffees/map", to: "coffees#map"

  resources :coffees do
    resources :purchases, only: %i[index show destroy new create]
  end

end
