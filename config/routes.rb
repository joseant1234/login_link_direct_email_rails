Rails.application.routes.draw do
  get 'email_links/new'
  get 'email_links/validate', as: :email_link
  post 'email_links/create', as: :send_link
  devise_for :users
  root "main#welcome"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
