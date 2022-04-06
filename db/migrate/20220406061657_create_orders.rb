class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id, foreign_key: true
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :postage, null: false
      t.integer :invoice, null: false
      t.integer :payment_method, default: 0 ,null: false
      t.integer :status, default: 0 ,null: false
      
    end
  end
end
