Rails.application.routes.draw do
  root to: redirect('/trends')
  resources :trends do
    collection do
      post :import
    end
  end
end
