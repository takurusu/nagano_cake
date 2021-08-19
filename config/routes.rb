Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins, path: :admin, views: {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }

  namespace :admin do
   root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

end
