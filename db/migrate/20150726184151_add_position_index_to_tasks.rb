class AddPositionIndexToTasks < ActiveRecord::Migration
  def change
    add_index :tasks, :position
  end
end
