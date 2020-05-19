Rails.application.routes.draw do
  get '/validate', to: 'codes#validate'
  post '/validate', to: 'codes#validate_code'
  resources :codes
  devise_for :users
  root "codes#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
