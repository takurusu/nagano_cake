Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :customers

  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :customers
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :update, :create]
  resources :orders, only: [:new, :create, :index, :show]

  devise_for :admins, path: :admin, views: {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }

  namespace :admin do
   root to: 'homes#top'
   resources :genres, only: [:index, :new, :create, :edit, :update]
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :orders
  end

end
