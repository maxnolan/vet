class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all

    render json: @appointments
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  private
    def appointment_params
      params.require(:appointment).permit(:appointment_time, :pet_id, :veterinarian_id)
    end
end
