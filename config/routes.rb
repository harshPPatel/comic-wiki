Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'volumes#index'
  resources :volumes
  resources :issues
  resources :characters

  get '/about', to: 'static_pages#about'
  get '/search' => 'static_pages#search', :as => 'search_page'

end
