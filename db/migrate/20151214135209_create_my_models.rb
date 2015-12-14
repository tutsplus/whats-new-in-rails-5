class CreateMyModels < ActiveRecord::Migration
  def change
    create_table :my_models do |t|
      t.string :my_token

      t.timestamps
    end
    add_index :my_models, :my_token, unique: true
  end
end
