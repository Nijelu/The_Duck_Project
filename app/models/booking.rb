class Booking < ApplicationRecord
  belongs_to :duck
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[waiting pending finished] }
  validates :duck, presence: true
  validates :user, presence: true
end
