Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :customers

  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'customers/unsubscribe' => "customers#unsubscribe"
  patch 'customers/status' => "customers#status"
  resources :customers, only: [:show, :edit, :update, :unsubscribe, :status]
  resources :items, only: [:new, :index, :show]
  resources :cart_items, only: [:index, :update, :create]
    delete 'cart_items/:id' => "cart_items#one"
    delete 'cart_items' => "cart_items#all"
  get 'orders/complete' => "orders#complete"
  resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm' => "orders#confirm"
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  devise_for :admins, path: :admin, views: {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }

  namespace :admin do
   root to: 'homes#top'
   resources :genres, only: [:index, :new, :create, :edit, :update]
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :orders, only: [:show, :update, :makes]
  end

end
