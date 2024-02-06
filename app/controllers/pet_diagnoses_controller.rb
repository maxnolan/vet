class PetDiagnosesController < ApplicationController
  before_action :set_pet

  # GET /diagnoses
  def index
    render json: @pet.diagnoses
  end

  # POST /diagnoses
  def create
    @diagnosis = Diagnosis.find(params[:diagnosis_id])
    @pet.diagnoses << @diagnosis

    render json: @pet.diagnoses
  end

  # DELETE /diagnoses/1
  def destroy
    @diagnosis = Diagnosis.find(params[:id])
    @pet.diagnoses.delete(@diagnosis)

    render json: @pet.diagnoses
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:pet_id])
    end
end
