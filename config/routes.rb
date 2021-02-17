Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile'}
             
  resources :users, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boards do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :create]
  # get 'dashboard', to 'dashboard#dashboard'
end
