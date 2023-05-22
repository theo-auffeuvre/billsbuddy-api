class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :siret
      t.string :address
      t.string :additional_address
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :intracom_vat_number
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
