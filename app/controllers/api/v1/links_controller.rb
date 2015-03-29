class Api::V1::LinksController < ApplicationController
	respond_to :html, :json

	def index
		@links = Link.all
		respond_with @links 
	end

	def show
		@link = Link.find(params[:id])
		respond_with @link
	end

	def create
		@link = Link.create(link_params)
		respond_with @link
	end

	def update
		@link = Link.find(params[:id])
		respond_with @link.update(link_params)
	end
		
	private

	def link_params
		params.require(:link).permit(:given_url, :title, :slug, :clicks)
	end
end
