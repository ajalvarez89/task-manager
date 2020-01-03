class TasksController < ApplicationController
  before_action :set_current_task_employee,
  only: %i[edit update destroy complete take]

  def new
    @task = current_employee.created_tasks.create
  end

  def create
    @task = current_employee.created_tasks.create(task_params)

    if @task.save
      redirect_to authenticated_root_path, notice: 'You created new task'
    else
      render :new
    end
  end

  def show
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to current_employee, notice: 'Successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy

    redirect_back(fallback_location: authenticated_root_path,
                  notice: 'Task deleted')
  end

  def complete
    @task = Task.find(params[:id])
    @task[:finished_at] = Time.zone.now
    @task.complete!

    redirect_to authenticated_root_path, notice: 'You has finished task'
  end

  def take
    @task = Task.find(params[:id])
    @task[:started_at] = Time.zone.now
    @task.in_work!

    redirect_to authenticated_root_path, notice: 'Lets work!'
  end

  private

  def set_current_task_employee
    @task = current_employee.assigned_tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :assignee_id)
  end
end
