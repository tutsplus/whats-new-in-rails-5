class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :task, index: true, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
