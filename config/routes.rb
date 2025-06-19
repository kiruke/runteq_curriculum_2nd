Rails.application.routes.draw do
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: [:new, :create] do
    resources :bookmarks, only: [:index], shallow: true
  end
  resources :boards, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy], shallow: true
    resources :bookmarks, only: [:create, :destroy], shallow: true
  end
end
