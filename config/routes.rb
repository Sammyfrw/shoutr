require "monban/constraints/signed_in"

Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  
  resources :shouts, only: [:create]

  resources :users, only: [:show, :new, :create] do  
    resource :following_relationship, only: [:create]
  end

constraints Monban::Constraints::SignedIn.new do

  get "/", to: "dashboards#new", as: "dashboard"
end

  root to: "sessions#new"

end
