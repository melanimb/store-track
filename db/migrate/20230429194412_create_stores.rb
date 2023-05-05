class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name, limit: 255

      t.timestamps
    end
  end
end
