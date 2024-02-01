class Pets::PhotosController < ::PhotosController
  private
    def set_imageable
      @imageable = Pet.find(params[:pet_id])
    end
end

