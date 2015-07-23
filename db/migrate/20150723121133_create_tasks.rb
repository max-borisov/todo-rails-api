class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string      :description, null:   false
      t.boolean     :completed,   null:   false,  default: false
      t.references  :project,     index:  true,   foreign_key: true

      t.timestamps null: false
    end
  end
end
