class PhotosController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos.order(id: "DESC")
    @album_author = User.find(@album.user_id)
    birthday = @album.birthday
    now_year_birthday = Date.new(Date.today.year, birthday.month, birthday.day)
    today = Date.today
    @age = today.year - birthday.year
    if today.month < birthday.month or (today.month == birthday.month and today.day < birthday.day)
      @age -= 1 # まだ誕生日を迎えていない
    end
    if today > now_year_birthday
      @month = (today - now_year_birthday) / 30
    else
      now_year_birthday = Date.new(Date.today.year + 1, birthday.month, birthday.day)
      @month = (today - now_year_birthday) / 30
    end
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
