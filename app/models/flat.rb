class Flat < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price_per_night, presence: true, numericality: true
  validates :number_of_guests, presence: true, numericality: true, inclusion: { in: 1..7 }
end
