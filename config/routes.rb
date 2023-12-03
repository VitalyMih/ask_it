Rails.application.routes.draw do
  root 'pages#index'

  resources :questions, only: %i[index new create]
end
