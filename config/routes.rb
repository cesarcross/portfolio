Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'ofertas', to: 'pages#ofertas', as: :ofertas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pages, only: %i[ofertas create]
end
