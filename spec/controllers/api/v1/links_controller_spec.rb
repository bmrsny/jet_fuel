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

	it "#update" do
		link = create(:link, id: 554)
		put :update, id: link.id, format: :json, link: {
																				 given_url: "google.com/about", 
																			   title: "my title1", 
																				 slug: "KHtKtttttJKD", 
																				 clicks: 6 } 
		updated_link = Link.find(554)

		expect(response.status).to eq(204)
		expect(updated_link.given_url).to eq("google.com/about")
		expect(updated_link.title).to eq("my title1")
	end

	it "#delete" do
		post :create, format: :json, link:{ 
				  															given_url: "google.com",
		      															id: 354,
																			  title: "my title", 
																			  slug: "KHDKDKJDKJKD", 
																				clicks: 2
																			}
		link = JSON.parse(response.body)

		delete :destroy, format: :json, id: link["id"]	

		expect(Link.all.count).to eq(0)
	end
end
