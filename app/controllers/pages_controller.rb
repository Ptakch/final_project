class PagesController < ApplicationController
	def home
		require 'wistia'

		Wistia.use_config!(:wistia => {
		  :api => {
		    :password => ENV['wistia_password'],
		    :format => 'json'
		  }
		})

	#	@all_vids = Wistia::Media.find(:all)
	#	@all_projects = Wistia::Project.find(:all)

	@users = User.all
	@videos = Video.all
	end
end
