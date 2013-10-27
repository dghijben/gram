class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to photos_path
  end
  
  def destroy
    @photo = Photo.destroy(params[:id])
    redirect_to photos_path
  end
  
  def photo_params
      params.require(:photo).permit(:title, :image, :user_id, :remote_image_url)
    end
end
