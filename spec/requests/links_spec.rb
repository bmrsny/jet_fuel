require 'rails_helper'

RSpec.describe "Links", :type => :request do
  describe "GET /links" do
		before(:each) do
			FactoryGirl.reload
		end

    it "should have a list of links sorted by popularity" do
			link1 = create(:link, clicks: 2)
			link2 = create(:link, clicks: 20)
			link3 = create(:link, clicks: 29)

			visit root_path
			click_link "Sort by views"

			within("div.all-links table tbody tr th:nth-child(1)") do
				expect(page).to have_content(link3.given_url)
			end
    end
  end

	it "should be able to sort the links by created_at attribute" do
	
		link1 = create(:link, clicks: 2)
		link2 = create(:link, given_url: "google3.com")

		visit root_path
			click_link "Sort by created at"

			within("div.all-links table tbody tr th:nth-child(1)") do
				expect(page).to have_content(link2.given_url)
    end
	end
end
