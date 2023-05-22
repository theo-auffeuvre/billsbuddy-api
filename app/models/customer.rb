class Customer < ApplicationRecord
  belongs_to :company
  has_many :invoices, dependent: :destroy
end
