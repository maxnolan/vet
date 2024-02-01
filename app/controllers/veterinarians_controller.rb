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

  def update
    @vet = Veterinarian.find(params[:id])

    if @vet.update(veterinarian_params)
      render json: @vet
    else
      render json: @vet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vet = Veterinarian.find(params[:id])
    @vet.destroy

     render status: :no_content
  end
  
  private
    def veterinarian_params
      params.require(:veterinarian).permit(:name, :license)
    end
end
