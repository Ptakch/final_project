Project.destroy_all
Video.destroy_all
User.destroy_all

require 'wistia'

Wistia.use_config!(:wistia => {
  :api => {
    :password => ENV['wistia_password'],
    :format => 'json'
  }
})

@all_vids = Wistia::Media.find(:all)

@all_vids.elements.each do |element|
	if Video.find_by( :name => element.name ).nil?
		@video = Video.new
		@video.name = element.name
		@video.description = element.description
		@video.embedcode = element.attributes["embedCode"]
		@video.thumbnail = element.attributes["thumbnail"].url
		@video.save
	end
end

@all_projects = Wistia::Project.find(:all)

@all_projects.elements.each do |project|
	hashedId = project.attributes["hashedId"]
	current_project = Wistia::Project.find( hashedId )
	db_project = Project.new
	db_project.name = current_project.attributes["name"]
	db_project.hash_id = hashedId
	db_project.save

	associated_videos = current_project.attributes["medias"]

	associated_videos.each do |video|
		db_video = Video.find_by :name => video.attributes["name"]
		unless db_video.nil?
			db_video.update :project_id => db_project.id
		end
	end
end



u1 = User.create :name => "Philbo Baggins", :email => "Phill@baggins.com", :password => "chicken", :password_confirmation => "chicken", :admin => false
u2 = User.create :name => "Samwise Gamgee", :email => "Samuel@gamgee.com", :password => "chicken", :password_confirmation => "chicken"
u3 = User.create :name => "John Usa", :email => "john@usa.com", :password => "chicken", :password_confirmation => "chicken"












