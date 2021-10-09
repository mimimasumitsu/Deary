class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    @album = Album.find(params[:album_id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.album_id = current_user.id
    if @photo.save
      redirect_to album_photos_path
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
    @album = Album.find(params[:album_id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to album_photos_path(params[:album_id])
  end

  private

  def photo_params
    params.require(:photo).permit(:album_id, :image, :comment)
  end
end
