module DefaultSettings
  extend ActiveSupport::Concern

  included do
  	before_action :set_page_defaults
  end
	
	def set_page_defaults
		@page_title = "Steve Hunter's Portfolio | My CV"
		@seo_keywords = "credit hire, insurance claims, consultant, 
											expert, cross-class claims, claimant, 
											defendant, CHO, ABI GTA, department head, 
											operations, technical claims"
	end

end


	