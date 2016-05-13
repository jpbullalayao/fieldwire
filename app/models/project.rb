# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ActiveRecord::Base

  #= Associations
  has_many :floorplans, dependent: :destroy

  #= Validations
  validates :name, presence: true, length: { maximum: 255 }

  def create_floorplan(params)

    display_name = params[:display_name]
    blueprint    = params[:blueprint]
    image        = blueprint.tempfile

    if display_name.blank?
      filename     = FILENAME_REGEX.match(blueprint.original_filename)[1] # Get Match Group (Note, this regex can be made better)
      display_name = filename
    end

    floorplan = floorplans.create(display_name: display_name)

    if floorplan.valid?
      image_urls =
        {
          original:  "#{AWS_CF_FIELDWIRE_URL}/floorplans/#{floorplan.id}/original.png",
          thumb_url: "#{AWS_CF_FIELDWIRE_URL}/floorplans/#{floorplan.id}/thumb.png",
          large_url: "#{AWS_CF_FIELDWIRE_URL}/floorplans/#{floorplan.id}/large.png"
        }

      floorplan.update_attributes(blueprint: image_urls)
      floorplan.delay.upload_floorplans(image)
    end

    floorplan
  end

end
