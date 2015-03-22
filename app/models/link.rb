class Link < ActiveRecord::Base
	after_create :generate_slug

	def generate_slug
		self.slug = SecureRandom.urlsafe_base64(8) 
		self.save
	end
end
