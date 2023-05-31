class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :description
      t.integer :product_quantity
      t.decimal :price
      t.string :product_image

      t.timestamps
    end
  end
end
