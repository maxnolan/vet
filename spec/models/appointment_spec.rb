require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it "fails validation when appointment time is past" do
    pet = Pet.create!(name: "Rover")
    veterinarian = Veterinarian.create!(name: "My Vet")
    appointment = Appointment.new({ pet_id: pet.id, veterinarian_id: veterinarian.id,
                      appointment_time: Date.yesterday })
    expect(appointment).to be_invalid
  end
end
