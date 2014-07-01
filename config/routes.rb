require "monban/constraints/signed_in"

Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  
  resources :shouts, only: [:create] do

  end
  
  resources :text_subjects, only: [:create]

  resources :users, only: [:show, :new, :create] do  
    resource :following_relationship, only: [:create, :destroy]
  end

constraints Monban::Constraints::SignedIn.new do
  root to: "dashboards#new", as: :dashboard
  resource :following, only: [:show]
  resource :followers, only: [:show]
  resource :following_relationship, only: [:create, :destroy]
end

  root to: "sessions#new"

end
