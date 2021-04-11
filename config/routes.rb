Rails.application.routes.draw do
  # registrations_controller.rbで記述する内容を有効にする
  devise_for :users,controllers: {
    registrations: 'users/registrations'
  }
  # get 'users/:id', to: 'users#show', as: 'user_page'

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  #users=index,users#showのルーティング追加
  resources :users, :only => [:index, :show]
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
