# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_24_143616) do
  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "siret"
    t.string "address"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "siret"
    t.string "address"
    t.string "additional_address"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "intracom_vat_number"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_customers_on_company_id"
  end

  create_table "delivery_addresses", force: :cascade do |t|
    t.string "address"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.integer "invoice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_delivery_addresses_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "title"
    t.date "issue_date"
    t.string "payment_due"
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "type"
    t.string "designation"
    t.integer "qty"
    t.string "unit"
    t.float "price"
    t.string "vat_pourcentage"
    t.integer "invoice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_products_on_invoice_id"
  end

  create_table "user_companies", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_user_companies_on_company_id"
    t.index ["user_id"], name: "index_user_companies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "customers", "companies"
  add_foreign_key "delivery_addresses", "invoices"
  add_foreign_key "invoices", "customers"
  add_foreign_key "products", "invoices"
  add_foreign_key "user_companies", "companies"
  add_foreign_key "user_companies", "users"
end
