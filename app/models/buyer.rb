class Buyer < ApplicationRecord
  has_one :order

  # validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # validates :prefecturem, numericality: {other_than: 0, message: "can't be blank"}
end
