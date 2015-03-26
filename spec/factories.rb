FactoryGirl.define do
  factory :link do
   	sequence(:given_url) { |n| "Google.com/food/yuck#{n}" }
   	clicks 1
		title "Google"
	end
 end
