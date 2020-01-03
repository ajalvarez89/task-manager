class AddNameToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :name, :string , null: false
    add_column :employees, :last_name, :string , null: false
  end
end
