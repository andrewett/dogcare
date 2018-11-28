Rails.application.routes.draw do
  root 'home#index'
  get 'active' => 'home#toggle_dog'
  get 'remove_all' => 'home#toggle_all'
  resources :dogs
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
