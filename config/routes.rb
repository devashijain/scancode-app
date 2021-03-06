Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json}do
    namespace :v1 do
      resources :scans
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        delete "sign_out", to: "sessions#destroy"
        get "users", to: "sessions#index"
      end
    end
  end
end
