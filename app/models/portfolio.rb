class Portfolio < ApplicationRecord
	
	has_many :technologies
	include Placeholder
	accepts_nested_attributes_for :technologies, 
																reject_if: lambda { |attr| attr['name'].blank? }
	after_initialize :set_defaults
	validates_presence_of :title, :body, :main_image, :thumb_image

	mount_uploader :thumb_image, PortfolioUploader
	mount_uploader :main_image,  PortfolioUploader

	def self.angular
		where(subtitle: "Angular")
	end

	def self.by_position
		order("position ASC")
	end

	scope :ruby_on_rails, -> {
		where(subtitle: "Ruby on Rails")
	}

	def set_defaults
		self.main_image  ||= Placeholder.image_generator(height: 600, width: 400)
		self.thumb_image ||= Placeholder.image_generator(height: 350, width: 200)
	end

end