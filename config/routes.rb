Rails.application.routes.draw do
  get 'user_index' => 'employee#user_index'
  put 'upgrade_user' => 'employee#upgrade_user'
  put 'downgrade_user' => 'employee#downgrade_user'
  devise_for :users
  root 'home#index'
  get 'active' => 'home#toggle_dog'
  get 'remove_all' => 'home#toggle_all'
  resources :dogs
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
