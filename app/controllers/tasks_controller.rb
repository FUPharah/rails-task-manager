class TasksController < ApplicationController

  def index
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def create

  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)  #if update is successful redirects to tasks/show
      redirect_to @task
    else
      render 'edit'  #if not successful it will go back to edit
    end
  end

  def destroy
    @task = Task.destroy
    @task.destroy
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
