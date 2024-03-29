class Veterinarian < ApplicationRecord
  has_many :appointments
  has_many :pets, through: :appointments
  has_many :photos, as: :imageable

  validates :name, presence: true
end
