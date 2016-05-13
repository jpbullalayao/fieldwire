class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project    = Project.find(params[:id])
    @floorplans = @project.floorplans
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      redirect_to :back
    end
  end

  private

  #= Strong Parameters
  def project_params
    params.require(:project).permit(:name)
  end
  
end
