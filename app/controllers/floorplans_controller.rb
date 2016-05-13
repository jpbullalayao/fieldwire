class FloorplansController < ApplicationController

  before_action :get_project

  def create
    @floorplan = @project.create_floorplan(floorplans_params)
    if @floorplan.present?
      redirect_to project_path(@project)
    else

    end
  end

  private

  def get_project
    @project = Project.find(params[:project_id])
  end

  #= Stong Parameters
  def floorplans_params
    params.require(:floorplan).permit(
      :display_name,
      :blueprint
    )
  end
end
