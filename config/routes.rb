Rails.application.routes.draw do
  devise_for :customers, controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'admin' => 'admin/homes#top'
  scope module: :public do
    resources :customers
  end
  namespace :admin do
   resources :genres
   resources :items
   resources :customers
  end
end
