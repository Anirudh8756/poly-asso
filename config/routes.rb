Rails.application.routes.draw do
  resources :articles do
    resources :comments ,only: %i[create]
  end
  resources :posts do
    resources :comments ,only: %i[create]
  end
root 'posts#index'
end
