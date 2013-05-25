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
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #���L�A�ǉ��������[�e�B���O�̐ݒ�B��������̍s�̓f�t�H���g�ō쐬�����T���v���B�S��
  #�R�����g�A�E�g���ꂽ��Ԃ��f�t�H���g
  
  #URL�ɁA"/2chan"���w�肳�ꂽ��A"topics"�R���g���[����"index"���\�b�h�����s����
  #�ŁA����URL���r���[����URL�w���p�[�ŎQ�Ƃł���悤�ɂ���
  # �����L:as => :topics�ŁA�r���[����topics_url��topics_pash���Q�Ƃł���
  match "/2chan" => "topics#index", :as => :topics
  #:via�w��ɂ��Apost�Aget�ȂǁAHTTP���\�b�h�����肷�邱�Ƃ��ł���
  #���L��post���\�b�h�Ɍ��肵���ꍇ
  match "/2chan/create" => "topics#create", :as => :create_topic, :via => :post
  match "/2chan/:topic_id" => "comment#index", :as => :comments  
  #���L��:vis�w��ɂ��Apost�Aget���\�b�h�Ɍ��肵���ꍇ(�z��ł̎w��ƂȂ�j
  match "/2chan/:topic_id/create" => "comment#create", :as => :create_comment, :via => [:get, :post]

end
