class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :pet, index: true, foreign_key: true
      t.belongs_to :veterinarian, index: true, foreign_key: true
      t.datetime :appointment_time
      t.timestamps
    end
  end
end
