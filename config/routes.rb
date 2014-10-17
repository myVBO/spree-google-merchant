Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :taxon_map
    resource :google_base_settings
  end

  get 'google_merchant_products' => 'products#google_merchant_products'

end
