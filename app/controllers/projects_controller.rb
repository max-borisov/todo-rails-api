class ProjectsController < ApplicationController
  protect_from_forgery except: :destroy
  before_action :set_project, only: [:update, :destroy]

  def index
    @projects = Project.all.order(id: :asc)
    render json: @projects.as_json
  end

  def create
    @project = Project.create(title: "Project ##{Project.count + 1}")
    render json: @project.as_json
  end

  def update
    @project.update(project_params)
    render json: @project.as_json
  end

  def destroy
    @project.destroy
    render json: @project.as_json
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title)
  end
end
