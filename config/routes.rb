Rails.application.routes.draw do

  resources :qnas, only: [:new, :create]

  resources :problems, only: [:create, :destroy, :index, :new]

  resources :votes, only: [:create]

  resources :polls

  resources :forums, except: [:edit, :update]

  resources :comments, only: [:create, :edit, :update, :destroy]

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:index, :show]

  root 'pages#home'

  match '/privacy', to: 'pages#privacy', via: 'get'

  match '/terms', to: 'pages#terms', via: 'get'

  match '/about', to: 'pages#about', via: 'get'

  match '/guestbook', to: 'problems#index', via: 'get'

  # match 'users/:id', to: 'users#show', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
