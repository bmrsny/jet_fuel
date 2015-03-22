class LinksController < ApplicationController
	def index 
		@links = Link.all
	end

	def show
		@link = Link.find(params[:id])
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
