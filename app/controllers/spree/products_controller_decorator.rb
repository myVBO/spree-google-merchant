
Spree::ProductsController.class_eval do
  def google_merchant_products
    render xml: SpreeGoogleBase::FeedBuilder.generate_xml
  end
end
