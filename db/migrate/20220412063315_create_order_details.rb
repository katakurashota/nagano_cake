class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.timestamps
      t.integer :item_id, foreign_key: true
      t.integer :order_id, foreign_key: true
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :status, default: 0 ,null: false

    end
  end
end
