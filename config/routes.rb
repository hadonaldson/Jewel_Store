Rails.application.routes.draw do
  resources :jewels
  resources :collections
  get '/home', to: 'collections#index'
  resources :jewels do
     member do
        get :flop
        get :sell
     end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
