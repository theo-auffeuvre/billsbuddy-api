class Company < ApplicationRecord
  has_many :user_companies
  has_many :users, through: :user_companies
  has_many :customers, dependent: :destroy
end
