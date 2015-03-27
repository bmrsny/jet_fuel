class Link < ActiveRecord::Base
	#validates :given_url, uniqueness: true
	after_create :generate_slug

	def generate_slug
		self.slug = SecureRandom.urlsafe_base64(8) 
		self.save
	end

	def display_short_url
		ENV["BASE_URL"] + "/" + "#{self.slug}"
	end

	def self.sort_by_popularity
		all.order(clicks: :desc)
	end

	def self.sort_by_created_at
		all.order(created_at: :desc)
	end
end
