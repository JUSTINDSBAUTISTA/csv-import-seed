Rails.application.routes.draw do
  resources :trends, only: [:index] do
    collection { post :import }
  end

  root "trends#index"
end
