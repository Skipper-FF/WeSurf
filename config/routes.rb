Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile'},
             controllers: {
                 registrations: 'registrations'
             }

  resources :users, only: :show
  resources :boards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :boards do
    resources :booking, only: [:new]
  end
end
