# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :posts, only: %i[show new create]
end
