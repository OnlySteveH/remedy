Rails.application.routes.draw do
	
  devise_for :users, path: '', path_names: {  sign_in: 'login', 
                                              sign_out: 'logout', 
                                              sign_up: 'register' }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  
  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end

  root to: 'pages#home'

  get 'about',    to: 'pages#about'
  get 'contact',  to: 'pages#contact'
  get 'location', to: 'pages#location'
  get 'privacy',  to: 'pages#privacy'

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to: 'portfolios#angular'
end