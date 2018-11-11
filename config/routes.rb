Rails.application.routes.draw do
  # get 'store/index'
  root 'store#index', as: 'store_index' # make root path/homepage
  resources :products
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
