Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile'}
            #  controllers: {
            #      bookings: 'bookings'
            #  }

  resources :users, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boards do
    resources :booking, only: [:new, :create]
  end

  resources :bookings, only [:index, :show]
  get 'dashboard', to 'dashboard#dashboard'
end
