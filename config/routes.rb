Rails.application.routes.draw do
  root to: 'pages#home'

  resources :artists do
    resources :songs, only: [:create, :destroy]
  end
  resources :photos, only: [:destroy]
  namespace :api do
    namespace :artists do
      resources :songs, only: [:create, :destroy]
    end
  end
end
