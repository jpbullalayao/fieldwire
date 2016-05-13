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

class Floorplan < ActiveRecord::Base

  #= Associations
  belongs_to :project

  #= Validations
  validates :display_name, presence: true, length: { maximum: 255 }

  #= Services
  include ImageUploadService

  #= Misc
  serialize :blueprint, Hash

  def upload_floorplans(image)
    # Original
    upload_to_s3(AWS_S3_BUCKET_FIELDWIRE, image, "floorplans/#{id}/original.png")

    # Thumb
    thumb = resize(image, 100)
    upload_to_s3(AWS_S3_BUCKET_FIELDWIRE, thumb, "floorplans/#{id}/thumb.png")

    # Large
    large = resize(image, 2000)
    upload_to_s3(AWS_S3_BUCKET_FIELDWIRE, large, "floorplans/#{id}/large.png")
  end

end
