class ChangeNameToTask < ActiveRecord::Migration[6.0]
  def change
    rename_column(:employees, :name, :first_name)
  end
end
