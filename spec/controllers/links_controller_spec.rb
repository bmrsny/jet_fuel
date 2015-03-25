require "rails_helper"

RSpec.describe LinksController do
  describe "#index" do
    it "lists out all links" do
			 Link.create(given_url: "http://google.com", slug: "898480AHD", clicks: 2, title: "Google")
			 Link.create(given_url: "http://yahoo.com", slug: "89888hAuD", clicks: 1, title: "Google")
			 links = Link.all
      get :index

			expect(links.first.given_url).to eq("http://google.com")
			expect(response.status).to eq(200)
    end
  end
end
