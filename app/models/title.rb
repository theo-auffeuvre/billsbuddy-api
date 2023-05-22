class Title < ApplicationRecord
  belongs_to :customer
  belongs_to :delivery_address
  belongs_to :product
end
