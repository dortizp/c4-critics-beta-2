Rails.application.routes.draw do
  root "games#index"

  resources :critics
  resources :involved_companies
  resources :games do
    resources :critics

    # /games/:id/add_genre
    post "add_genre", on: :member
    # /games/:id/remove_genre
    delete "remove_genre", on: :member

    # /games/:id/add_platform
    post "add_platform", on: :member
    # /games/:id/remove_platform
    delete "remove_platform", on: :member
  end
  resources :platforms
  resources :genres
  resources :companies do
    resources :critics
  end
  resources :users

  # Routes for Codeable Design
  get "/design", to: "design#index"
  get "/design/sections", to: "design#sections"
end
