class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    t.string :name
    t.string :introduction
    t.integer :price
    t.string :is_active
    t.string :image_id
    t.integer :genre_id
      t.timestamps
    end
  end
end
