class VideosController < ApplicationController

	def index
		@videos = Video.all
		@all_projects = Project.all
	end

	def show
		@video = Video.find(params[:id])

		unless View.where( :user_id => @current_user.id ).nil?

			@view_count = View.where( :video_id => @video.id ).count
			@list_of_user_views = @video.views.pluck( :user_id )

			@last_viewed = View.where( :user_id => @current_user.id ).last

			if @last_viewed

				@all_video_ids = Video.pluck( :id ).sort
				@last_view_index = @all_video_ids.index @last_viewed.video_id

				if @video.id != @all_video_ids.sort.last

					@next_to_view = @all_video_ids[ @last_view_index + 1 ]
					@next_to_view = Video.find( @next_to_view ) if @next_to_view
				else
					@next_to_view = @last_viewed # put in just to see if works.	
					@next_to_view = Video.find( @next_to_view.video_id )
			    end
			end

		end

		# You have watched all videos (line 19)
		# You have already watched the found video (you could solve this with an)


		if @current_user && View.find_by( :user_id => @current_user.id, :video_id => @video.id ).nil?
			@view = View.new
			@view.user_id = @current_user.id
			@view.video_id = @video.id
			@view.save
		end

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
