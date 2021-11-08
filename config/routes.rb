Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get "home/about" => 'homes#about'
  resources :albums, only: [:index, :new, :create] do
    resources :photos, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
    resources :album_users, only: [:index, :new, :create, :destroy]
  end
end
