# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resource :users

  resources :districts do
    resources :reviews, except: %i[show index]
  end

  resources :tests, only: %i[edit update]
  root 'districts#index'
end
