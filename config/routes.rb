Rails.application.routes.draw do
  root to: 'pages#home'

  resources :artists do
    resources :songs, except: [:edit, :update, :show]
  end
end
