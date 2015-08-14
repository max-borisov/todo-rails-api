class ProjectsController < ApplicationController
  protect_from_forgery except: :destroy
  before_action :set_project, only: [:update, :destroy]

  def index
    projects = Project.all_records
    render json: projects
  end

  def create
    @project = Project.create(title: "Project ##{Project.count + 1}")
    render json: { status: :ok, project: { id: @project.id, title: @project.title } }
  end

  def update
    @project.update(project_params)
    render json: { status: :ok }
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
