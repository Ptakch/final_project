# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  embedcode   :string
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Video < ActiveRecord::Base
	belongs_to :project
end
