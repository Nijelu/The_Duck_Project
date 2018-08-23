class Duck < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :address, presence: true
  validates :user, presence: true

  include PgSearch
  pg_search_scope :search_by_title_and_description,
    against: { title: 'A', description: 'B' },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
