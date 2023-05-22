class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :title
      t.date :issue_date
      t.string :payment_due
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
