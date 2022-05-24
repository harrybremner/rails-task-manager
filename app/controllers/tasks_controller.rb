class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new # Needed to instantiate the form_for
  end

  def create
    @task = Task.new(task_params)
    @task.save # would raise ActiveModel::ForbiddenAttributesError without task_params
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    # No need for app/views/task/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
