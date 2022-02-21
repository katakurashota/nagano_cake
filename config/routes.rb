Rails.application.routes.draw do
  devise_for :customers, controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'admin/homes#top'
  get 'home/about' => 'homes#about'
  get 'admin/genres' => 'admin/genres#index'
  post 'admin/genres' => 'admin/genres#create'
end
