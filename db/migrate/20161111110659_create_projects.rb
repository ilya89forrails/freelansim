class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.boolean :cashless
      t.float :price
      t.integer :watch_count, default: 0
      t.text :description
      t.string :category
      t.timestamps
    end
  end
end
