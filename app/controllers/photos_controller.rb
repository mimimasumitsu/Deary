class PhotosController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos
    @album_author = User.find(@album.user_id)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.album_id = params[:album_id]
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
