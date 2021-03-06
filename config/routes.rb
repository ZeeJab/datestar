Datestar::Application.routes.draw do

  resources :users do
    resources :photos, :only => [:create, :destroy]
  end

  match '/photo' => 'photos#index', :via => :get, :as => :photos
  match '/photo' => 'photos#create', :via => :post

  match '/login' => 'session#new', :via => :get
  match '/login' => 'session#create', :via => :post
  match '/logout' => 'session#destroy', :via => :get

  match '/question' => 'questions#index', :via => :get, :as => :questions
  match '/question' => 'questions#create', :via => :post

  match '/answer' => 'answers#index', :via => :get, :as => :answers
  match '/answer' => 'answers#create', :via => :post

  match '/match/:id' => 'match#index', :via => :get, :as => 'match'
  match '/match/:id' => 'match#check', :via => :post
  match '/match/show/:id' => 'match#show', :via => :get, :as => 'match_show'

  match '/message/:id' => 'messages#index', :via => :get, :as => 'messages'
  match '/message/:id' => 'messages#create', :via => :post, :as => 'write'
  match '/sent/:id' => 'messages#sent', :via => :get, :as => 'sent'
  match '/inbox/:id' => 'messages#inbox', :via => :get, :as => 'inbox'

  # match '/photo/new' => 'photo#upload', :via => :get
  # match '/photo' => 'photo#save', :via => :post

  # match '/users/new' => 'users#new', :via => :get
  # match '/users' => 'users#create', :via => :post
  # match '/users/:id' => 'users#show', :via => :get, :as => 'user'
  # match '/users' => 'users#index', :via => :get

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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
