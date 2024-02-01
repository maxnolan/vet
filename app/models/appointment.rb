class Appointment < ApplicationRecord
  belongs_to :pet
  belongs_to :veterinarian

  validates :appointment_time, presence: true, comparison: { greater_than: DateTime.now }
end
