# == Schema Information
#
# Table name: floorplans
#
#  id           :integer          not null, primary key
#  display_name :string           not null
#  blueprint    :text
#  project_id   :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class FloorplanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
