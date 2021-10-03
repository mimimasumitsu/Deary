Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :albums, only: [:index, :new, :create]
  resources :photos, only: [:index, :new, :create, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
end
