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
		@link = Link.new(link_params)
		if @link.save
			flash[:notice] = "Link has been shortened"
			redirect_to links_path
		else
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
