class AddAttributesToEmployee < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :creator_id, :integer, index: true
    add_column :tasks, :assignee_id, :integer
  end
end
