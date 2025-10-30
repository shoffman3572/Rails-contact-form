# config/routes.rb
Rails.application.routes.draw do
  resources :contacts, only: [:new, :create] do
    collection { get :thanks }
  end

  root "contacts#new"
end
