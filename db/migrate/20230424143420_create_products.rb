class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :type
      t.string :designation
      t.integer :qty
      t.string :unit
      t.float :price
      t.string :vat_pourcentage
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
