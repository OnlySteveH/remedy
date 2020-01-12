module DefaultSettings
  extend ActiveSupport::Concern

  included do
  	before_action :set_page_defaults
  end
	
	def set_page_defaults
		@page_title = "Once More Ltd"
		@seo_keywords = "data breach, GDPR, data leak, compensation"
	end

end


	