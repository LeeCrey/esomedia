# frozen_string_literal: true

Rails.application.routes.draw do
  resources :chats
  root 'posts#index'

  resources :posts, except: [:index] do
    resources :comments, shallow: true do
      resources :replies
    end
    resources :votes, only: %i[index create]
    delete 'votes', to: 'votes#destroy'
    post 'seen', to: 'posts#mark_as_seen'
  end

  resources :users, only: %i[index show] do
    # follows
    resource :follows, only: %i[create destroy]
    get 'followings', to: 'follows#following'
    get 'followers', to: 'follows#follower'

  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_up: 'register',
    sign_out: 'logout'
  }, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
end
