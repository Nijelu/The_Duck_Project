class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :bookings
  has_many :ducks, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
