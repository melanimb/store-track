class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 255
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :quantity
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
