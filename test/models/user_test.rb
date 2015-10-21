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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
