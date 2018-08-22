class Duck < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :address, presence: true
  validates :user, presence: true
end
