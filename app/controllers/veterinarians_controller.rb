class VeterinariansController < ApplicationController
  def index
    @vets = Veterinarian.all

    render json: @vets
  end

  def show
    @vet = Veterinarian.find(params[:id])
   
    render json: @vet
  end

  def create
    @vet = Veterinarian.new(veterinarian_params)

    if @vet.save
      render json: @vet
    else
      render json: @vet.errors, status: :unprocessable_entity
    end
  end
  
  private
    def veterinarian_params
      params.require(:veterinarian).permit(:name, :license)
    end
end
