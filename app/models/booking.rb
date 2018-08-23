class Booking < ApplicationRecord
  belongs_to :duck
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[waiting pending finished] }
  validates :duck, presence: true
  validates :user, presence: true
  validate :validate_end_date_before_start_date
  validate :expiration_date_cannot_be_in_the_past

  def validate_end_date_before_start_date
    if end_date && start_date
      errors.add(:end_date, "End date cannot be before start date") if end_date < start_date
    end
  end


  def expiration_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

end
