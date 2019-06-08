class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :restaurant_id
      t.string :dish
      t.string :description
      t.boolean :vegetarian
      t.boolean :vegan
      t.boolean :glutenfree
      t.string :size
      t.string :price

      t.timestamps
    end
  end
end
