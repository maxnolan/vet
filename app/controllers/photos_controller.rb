class PhotosController < ApplicationController
  before_action :set_imageable

  def index
    render json: @imageable.photos
  end
  def show
    @photo = Photo.find(params[:id])

    render json: @photo
  end
  def create
    @photo = Photo.new(photo_params)
    @imageable.photos << @photo

    if @imageable.save
      render json: @imageable, include: :photos
    else
      render json: @imageable.errors, status: :unprocessable_entity
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:image_url)
    end
end

