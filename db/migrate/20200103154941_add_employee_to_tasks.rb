class AddEmployeeToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :employee, foreign_key: true
  end
end
