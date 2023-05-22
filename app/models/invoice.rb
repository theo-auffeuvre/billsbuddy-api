class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :delivery_addresses, dependent: :destroy
  has_many :products, dependent: :destroy
end
