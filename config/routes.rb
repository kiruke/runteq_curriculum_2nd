Rails.application.routes.draw do
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: [:new, :create]
  resources :boards, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy], shallow: true
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: [:create, :destroy]
  resource :profile, only: [:show, :edit, :update]
end
