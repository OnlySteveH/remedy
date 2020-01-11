module SetSource
	# module to track the source of a page visitor using a q in the URL
	extend ActiveSupport::Concern

	included do
		before_action :set_source
	end

	def set_source
		session[:source] = params[:q] if params[:q]
	end
end