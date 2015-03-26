require "rails_helper"

RSpec.describe Link do
	it "should generate a short url" do
		link = Link.create(given_url: "http://google.com/fishtacos")	
				
	end
end
