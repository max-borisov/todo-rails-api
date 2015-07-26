class AddPositionToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :position, :integer, null: false, default: 0
  end
end
