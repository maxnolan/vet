class Veterinarian < ApplicationRecord
  has_many :appointments
  has_one :photo, as: :imageable

  validates :name, presence: true
end
