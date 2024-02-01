class PetsController < ApplicationController
  def index
    @pets = Pet.all

    render json: @pets
  end

  def show
    @pet = Pet.find(params[:id])

    render json: @pet, include: :photo
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      render json: @pet, include: :photo, status: :created
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  def update
    @pet = Pet.find(params[:id])
    
    if @pet.update(pet_params)
      render json: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy

    render status: :no_content
  end

  private
    def pet_params
      params.require(:pet).permit(:name)
    end
end
