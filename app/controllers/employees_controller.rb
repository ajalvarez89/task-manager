class EmployeesController < ApplicationController
  before_action :set_current_employee, only: %i[update edit profile]
  before_action :authenticate_employee!, only: %i[update edit]

  def profile
    redirect_to unauthenticated_root_path if current_employee.nil?
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit; end

  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Successfully updated'
    else
      render :edit
    end
  end

  private

  def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email,:password, :password_confirmation)
  end

  def set_current_employee
    @employee = current_employee
  end
end
