Rails.application.routes.draw do
  devise_for :patients # adresy Devise dla pacjentów
  devise_for :doctors, :class_name => 'Doctor', :controllers => {:registrations => "doctors/registrations"} do
    get   "doctor/sign_up" => "doctor/registrations#new", :as => :new_doctor_registration # obsługa rejestracji kont lekarzy przez odpowiedni kontroler
  end
  resources :doctors, only: [:index] # adres listy lekarzy

  get 'static_pages/home' # adres strony głównej
  get 'static_pages/about' # adres strony o przychodni
  root 'static_pages#home' # ustalenie strony głównej

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
