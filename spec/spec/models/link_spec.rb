require "rails_helper"

RSpec.describe Link do
	it "should generate a short url" do
		link = Link.create(given_url: "http://google.com/fishtacos")	
		expect_any_instance_of(Link).to receive(:generate_slug).and_return("YDHSL87IHD") 
		expect(link.generate_slug).to eq("YDHSL87IHD")
	end
end
