class TasksController < ApplicationController
  before_action :set_project, only: [:create, :update, :destroy, :complete, :sort]
  before_action :set_task, only: [:update, :destroy, :complete]
  before_action :set_format

  def create
    @task = @project.tasks.create(task_params)
  end

  def update
    @task.update(task_params)
  end

  def destroy
    @task.destroy
  end

  def complete
    @task.update(completed: params[:task][:complete])
  end

  def sort
    Task.sort_tasks(params[:project][:tasks])
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description)
  end

  def set_format
    request.format = 'js'
  end
end
