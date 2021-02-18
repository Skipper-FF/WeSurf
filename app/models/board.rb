class Board < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :location, presence: true
end
