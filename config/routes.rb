# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :heros, only: %i[index show] do
      get 'abilities', to: 'heros#hero_abilities'
    end
    resources :abilities, only: %i[index show]
  end
end
