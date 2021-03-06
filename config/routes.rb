Rails.application.routes.draw do
  root 'projects#index'
  devise_for :users
  resources :projects do
    resources :rewards, only: [:new, :create, :edit, :update, :destroy]
    resources :pledges
  end

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
