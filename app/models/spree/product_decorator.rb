module Spree
  Product.class_eval do
    scope :google_base_scope, includes(:taxons, {:master => :images})
    
    def google_base_description
      description
    end
    
    def google_base_condition
      'new'
    end
    
    def google_base_availability
      'in stock'
    end

    def google_base_image_size
      :large
    end
    
    def google_base_gtin
      find_property('GTIN')
    end
    
    def google_base_brand
      (Spree::Taxon.brands.to_a & taxons.to_a).first.try(:name) || find_property('brand') || Spree::Config.site_name
    end
    
    def find_property(name)
      # Taken from github.com/romul/spree-solr-search
      # app/models/spree/product_decorator.rb
      #
      pp = Spree::ProductProperty.first(
        :joins => :property, 
        :conditions => {
          :product_id => self.id,
          :spree_properties => {:name => name}
        }
      )

      pp ? pp.value : nil      
    end
    
      

    def google_base_product_type
      return google_base_taxon_type unless Spree::GoogleBase::Config[:enable_taxon_mapping]

      product_type = ''
      priority = -1000
      self.taxons.each do |taxon|
        if taxon.taxon_map && taxon.taxon_map.priority > priority
          priority = taxon.taxon_map.priority
          product_type = taxon.taxon_map.product_type
        end
      end
      product_type
    end

    def google_base_taxon_type
      return unless taxons.any?

      taxons[0].self_and_ancestors.map(&:name).join(" > ")
    end
  end
end
