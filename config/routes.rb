Rails.application.routes.draw do
	root to: "links#index"
	resources :links, only: [:show, :index, :create]

	namespace :api do
		namespace :v1 do
			resources :links
		end
	end
end
