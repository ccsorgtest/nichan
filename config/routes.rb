Nichan::Application.routes.draw do
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id))(.:format)'


  #resources :topics
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #下記、追加したルーティングの設定。ここより上の行はデフォルトで作成されるサンプル。全て
  #コメントアウトされた状態がデフォルト
  
  #URLに、"/2chan"が指定されたら、"topics"コントローラの"index"メソッドを実行する
  #で、そのURLをビューからURLヘルパーで参照できるようにする
  # →下記:as => :topicsで、ビューからtopics_urlとtopics_pashが参照できる
  match "/2chan" => "topics#index", :as => :topics
  #:via指定により、post、getなど、HTTPメソッドを限定することができる
  #下記はpostメソッドに限定した場合
  match "/2chan/create" => "topics#create", :as => :create_topic, :via => :post
  match "/2chan/:topic_id" => "comment#index", :as => :comments  
  #下記は:vis指定により、post、getメソッドに限定した場合(配列での指定となる）
  match "/2chan/:topic_id/create" => "comment#create", :as => :create_comment, :via => [:get, :post]

end
