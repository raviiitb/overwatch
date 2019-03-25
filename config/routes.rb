Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :heroes, only: [:index, :show] do
      get 'abilities', to: 'heroes#abilities'
    end
    resources :abilities, only: [:index, :show]
  end
end
