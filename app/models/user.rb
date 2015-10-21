# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  admin           :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :text
#

class User < ActiveRecord::Base
	has_secure_password
end
