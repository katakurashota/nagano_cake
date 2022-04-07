Rails.application.routes.draw do
  namespace :public do
    get 'orders/index'
    get 'orders/show'
    get 'orders/new'
  end
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'admin' => 'admin/homes#top'
  get 'thanks' => 'public/orders#thanks'
  get 'customers/confirmation' => 'public/customers#confirmation'
  scope module: :public do
    resources :addresses
    resources :items, :only => [:index, :show]
    delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :cart_items
    resources :orders
    post 'orders/confirm' => 'orders#confirm'
    

    resource :customers, path: "customers/my_page", :only => [:show]
    resource :customers, :only => [:edit, :update]
  #get 'customers/mypage' => 'customers#show'
  patch 'withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  end
  devise_for :customers, controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}
  namespace :admin do
   resources :genres
   resources :items
   resources :customers
  end
end
