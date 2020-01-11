class Blog < ApplicationRecord
	belongs_to :topic
	validates_presence_of :title, :body

	extend FriendlyId

  friendly_id :title, use: :slugged
  enum status: { draft: 0, published: 1 }
end
