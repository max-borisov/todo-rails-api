class ProjectsController < ApplicationController
  protect_from_forgery except: :destroy
  before_action :set_project, only: [:update, :destroy]
  # layout false
  # respond_to :json

  def index
    # include related tasks
    # @projects = Project.includes(:tasks).order(created_at: :asc).all
    projects = Project.all_records
    render json: projects
  end

  def create
    @project = Project.create(title: "Project ##{Project.count + 1}")
  end

  def update
    @project.update(project_params)
  end

  def destroy
    @project.destroy
    render json: { status: :ok }
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title)
  end
end
