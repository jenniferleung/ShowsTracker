class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :category
      t.string :name
      t.boolean :is_complete
      t.float :episode
      t.text :description

      t.timestamps null: false
    end
  end
end
