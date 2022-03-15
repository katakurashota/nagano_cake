Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'admin' => 'admin/homes#top'
  get 'customers/confirmation' => 'public/customers#confirmation'
  scope module: :public do
    resources :addresses

    resource :customers, path: "customers/my_page", :only => [:show]
    resource :customers, :only => [:edit, :update]
  #get 'customers/mypage' => 'customers#show'
  patch '/withdrawal' => 'customers#withdrawal', as: 'withdrawal_user'
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
