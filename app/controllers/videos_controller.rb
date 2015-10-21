class VideosController < ApplicationController

	def index
		@videos = Video.all
		@all_projects = Project.all
	end

	def show
		@video = Video.find(params[:id])
		@all_vids = Video.all
	end

	def new 
		@user = User.new
	end

	def edit
	end

	def create
	end

	def update
	end
end
