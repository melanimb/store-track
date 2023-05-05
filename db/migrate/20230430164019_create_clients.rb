class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, limit: 255
      t.string :surname, limit: 255
      t.string :address, limit: 255
      t.string :email, limit: 255
      t.string :phone, limit: 255
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
