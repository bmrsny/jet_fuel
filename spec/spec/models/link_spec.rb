require "rails_helper"

RSpec.describe Link do
	it "should generate a short url" do
		link = Link.create(given_url: "http://google.com/fishtacos")	
		expect_any_instance_of(Link).to receive(:generate_slug).and_return("YDHSL87IHD") 
		expect(link.generate_slug).to eq("YDHSL87IHD")
	end

	it "should return all links sorted by popularity" do
		link1 = Link.create(given_url: "http://google.com/fishtacos")	
		link2 = Link.create(given_url: "http://google.com/about")	
		link3 = Link.create(given_url: "http://google.com/contact", clicks: 3)	
		link = Link.sort_by_popularity
		expect(link).to eq(link3)
	end

	it "should return all links sorted by reated at" do
		link1 = Link.create(given_url: "http://google.com/fishtacos")	
		link2 = Link.create(given_url: "http://google.com/about")	
		link3 = Link.create(given_url: "http://google.com/contact")	
		expect(Link.all.first).to eq(link1)
	end
end
