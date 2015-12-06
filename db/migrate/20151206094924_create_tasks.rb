class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.belongs_to :project, index: true, foreign_key: true
      t.boolean :done

      t.timestamps
    end
  end
end
