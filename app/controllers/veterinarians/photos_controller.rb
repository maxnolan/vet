class Veterinarians::PhotosController < ::PhotosController
  private
    def set_imageable
      @imageable = Veterinarian.find(params[:veterinarian_id])
    end
end

