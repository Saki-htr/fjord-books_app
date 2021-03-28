Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'home/index'
  devise_for :users
  #users=index,users#showのルーティング追加
  resources :users, :only => [:index, :show]
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # トップページのルーティングを追記
  root to: 'home#index'
end
