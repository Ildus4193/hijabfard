Hijabfard::Application.routes.draw do
  
  devise_for :admins

  get "ckeditor/index"

  resources :categories
  resources :line_items
  resources :carts
  resources :orders
  
  devise_scope :admin do 
    match "admin" => "devise/sessions#new", :as => "admin_sign_in"
  end
  #devise_for :users 
  devise_for :users #, :controllers => {:sessions => "users/sessions"}
  devise_scope :user do 
    #match "sign_in" => "devise/sessions#new", :as => "sign_in"
    match "sign_out" => "devise/sessions#destroy", :as => "destroy_session_user"
    match "users/sign_up" => "devise/registrations#new", :as => "sign_up"
    get "users/password/new" => "devise/passwords#new", :as => "recover_password", :method => :get
    
  end
  
  devise_for :users, :controllers => { :registrations => "registrations" } do
    match "profile/edit" => "registrations#edit", :as => "edit_member_registration"
  end
  match "/pages/:id/edit" => "pages#edit", :as => "pages_edit"
  resources :pages
  resources :products
  root :to => "pages#home", :id => 'home'

  match "*path" => redirect('/404.html')
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
