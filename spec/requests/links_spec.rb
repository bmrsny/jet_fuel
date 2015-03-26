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
			within all(".all-links")[1] do
				expect(page).to have_content(link3.given_url)
			end

			within all(".all-links")[2] do
				expect(page).to have_content(link2.given_url)
			end
			within all(".all-links")[3] do
				expect(page).to have_content(link1.given_url)
			end
    end
  end
end
