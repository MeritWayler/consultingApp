Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
      }
  get 'home/index'	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  #PROFILES
  get 'profile', to: 'profiles#index'
  get 'viewProfiles', to: 'profiles#viewProfiles'

  #INVOICES
  get 'upload', to: 'invoices#index', as: :upload_file
  post 'upload', to: 'invoices#upload'
  get 'viewInvoices', to: 'invoices#viewInvoices'
 #authentication
  



end
