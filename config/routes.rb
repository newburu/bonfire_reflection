Rails.application.routes.draw do
  devise_for :users, skip: :registrations, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    get "users/edit", to: "devise/registrations#edit", as: :edit_user_registration
    put "users", to: "devise/registrations#update", as: :user_registration
    delete "users", to: "devise/registrations#destroy"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"

  resources :reflections, only: [ :index, :create ]
  resource :user_strengths, only: [ :edit, :update ]
end
