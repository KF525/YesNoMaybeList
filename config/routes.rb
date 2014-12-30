Rails.application.routes.draw do

  root 'home#index'

  #USERS
  get 'signup',                         to: 'users#new',                  as: :signup
  post 'users',                         to: 'users#create'
  get 'users/:id',                      to: 'users#show',                 as: :user

  #SESSIONS
  get 'login',                          to: 'sessions#new',               as: :login
  post 'sessions',                      to: 'sessions#create',            as: :sessions
  delete 'logout',                      to: 'sessions#destroy',           as: :logout

  #PASSWORDS
  get 'reset_password',                 to: 'password_resets#new',        as: :password_reset
  post 'reset_password',                to: 'password_resets#create'
  patch 'reset_password',               to: 'password_resets#update'
  get 'reset_password/:id/edit',        to: 'password_resets#edit',       as: :edit_password_reset

  #ACTIVITIES
  get 'activities',                     to: 'activities#index',           as: :activities
  post 'activities',                    to: 'activities#create',          as: :add_activity
  delete 'activities',                  to: 'activities#destroy',         as: :remove_activity

  resources :relationships, only: [:show, :create], shallow: true do
    resources :answers

  end


  #resources :password_resets
  #resources :users
  #resources :sessions
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
