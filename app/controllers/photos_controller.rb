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
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      flash[:success] = "Photo successfully uploaded!"
      redirect_to photos_path
    else
      render photos_path
    end
  end
  
  def destroy
      @photo = Photo.destroy(params[:id])
      redirect_to photos_path
    end
  
  def photo_params
      params.require(:photo).permit(:title, :image, :user_id, :remote_image_url)
    end
end
