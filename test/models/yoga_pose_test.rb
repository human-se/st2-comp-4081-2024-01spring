# == Schema Information
#
# Table name: yoga_poses
#
#  id           :bigint           not null, primary key
#  name         :string
#  part_of_body :string
#  sanskrit     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class YogaPoseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
