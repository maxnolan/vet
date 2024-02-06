class Pet < ApplicationRecord
  has_many :appointments
  has_many :veterinarians, through: :appointments
  has_many :photos, as: :imageable
  has_and_belongs_to_many :diagnoses

  validates :name, presence: true
end
