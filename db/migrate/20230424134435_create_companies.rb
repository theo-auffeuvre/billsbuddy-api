class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :siret
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
