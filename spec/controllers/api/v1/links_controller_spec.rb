require 'rails_helper'

RSpec.describe Api::V1::LinksController, :type => :controller do
	it "#index" do
		create(:link)
		get :index, format: :json
		link = JSON.parse(response.body)

		expect(response.status).to eq(200)
		expect(Link.all.count).to eq(1)
	end

	it "#show" do
		link = create(:link, id: 554)
		get :show, id: link.id, format: :json

		expect(response.status).to eq(200)
		expect(link.id).to eq(554)
	end

	it "#create" do
		json = {format: :json, link:{ given_url: "google.com", 
																			   title: "my title", 
																				 slug: "KHDKDKJDKJKD", 
																				 clicks: 2 }}
		post :create, json

		link = JSON.parse(response.body)

		expect(link["given_url"]).to eq("google.com")
		expect(response.status).to eq(201)
	end

	xit "#update" do
		link = create(:link, id: 554)
		put :update, id: link.id, format: :json, link: {
																				 given_url: "google.com/about", 
																			   title: "my title1", 
																				 slug: "KHtKtttttJKD", 
																				 clicks: 6 } 
	end
end
