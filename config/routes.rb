RubyClwBlog::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'pages#index'

  get '/pages/add' => "pages#add", as: 'add_page'
  get '/pages/:id/edit' => "pages#edit", as: 'edit_page'
  get '/pages/:id/destroy' => 'pages#destroy', as: 'destroy_page'
  get '/:path' => "pages#show", as: 'show_page'
  get '/:path/post/new' => 'posts#new', as: 'new_post'
  get '/:path/:id/edit' => 'posts#edit', as: 'edit_post'
  get '/:id/edit' => 'posts#edit', as: 'edit_root_post'
  get '/post/:id/destroy' => 'posts#destroy', as: 'destroy_post'
  get '/post/new' => 'posts#new', as: 'new_root_post'

  put '/pages/:id' => 'pages#update', as: 'page_update'
  put '/:path/:id' => 'posts#update'
  put '/:id' => 'posts#update'


  post '/:path' => 'posts#create'
  post '/' => 'posts#create'
  post '/pages/create' => 'pages#create'




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
