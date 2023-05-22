class CreateDeliveryAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_addresses do |t|
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :country
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
