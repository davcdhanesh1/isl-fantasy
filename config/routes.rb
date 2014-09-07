Rails.application.routes.draw do

  resources :players

  root 'static_pages#index'

  # Facebook callback uri
  match '/auth/:provider/callback', to: 'sessions#create', via: 'get'

  # Facebook auth failure
  match 'auth/failure', to: redirect('/'), via: [:get, :post]

  # Facebook signin uri
  match '/sign_in', to: redirect('/auth/facebook'), via: [:get]

  # Facebook signout uri
  match '/sign_out', to: 'sessions#destroy', via: 'get'

end
