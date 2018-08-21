class Duck < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, presence: true, uniqueness: { scope: :user }
  validates :description, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :address, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :user, presence: true
end
