class LinksController < ApplicationController

	def index 
		if params[:sort] == "popularity"
			@links = Link.sort_by_popularity
		elsif params[:sort] == "created_at"
			@links = Link.sort_by_created_at
		else
			@links = Link.all
		end
	end

	def create
		link = Link.find_by(given_url: params[:link][:given_url])
		if link
			flash[:notice] = "Check it out, this url already exists"
			redirect_to links_path
		else
		link = Link.new(link_params)
			if link.save
				TitleWorker.perform_async(link.given_url)	
				flash[:notice] = "Math-a-matical, your link has been shortened"
				redirect_to links_path
			end
		end
	end
	
	def show
		@link = Link.find(params[:id])
		@link.clicks += 1
		@link.save
		redirect_to @link.given_url
	end

	private

	def link_params
		params.require(:link).permit(:given_url, :slug, :clicks, :title)
	end
end
