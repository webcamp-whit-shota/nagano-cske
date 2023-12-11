Rails.application.routes.draw do
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  root to: 'public/homes#top'
 
  namespace :admin do
    resources :items, only: [:show, :edit, :index, :new, :create, :update]
    resources :customers, only: [:show, :edit, :index, :update]
    resources :orders, only: [:show]
    get 'homes/top' => 'homes#top', as: :admin_top
  end
  namespace :public do
    resources :items, only: [:show, :index,]
    resources :customers, only: [:show, :edit, :update, :confirm, :destroy]
    resources :orders, only: [:show, :create, :index, :new, :confirm, :completion]
    resources :cart_items, only: [:create, :destroy, :index, :update, :destroy_all]
    get 'homes/about' => 'homes#about', as: :about
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
