class AlbumUsersController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    @users = User.where(id: @album.album_users.pluck(:user_id))
    @album_author = User.find(@album.user_id)
  end

  def new
    @album_user = AlbumUser.new
    @album = Album.find(params[:album_id])
  end

  def create
    @album_user = AlbumUser.new(album_user_params)
    @album = Album.find(params[:album_id])
    @users = User.where(email: params[:album_user][:email])
    if @users.present?
      @album_user.user_id = @users.take.id
      if @album_user.save
        redirect_to album_album_users_path
      else
        render :new
      end
    end
  end

  def destroy
    @album_user = AlbumUser.find(params[:id])
    @album_user.destroy
    redirect_to album_album_users_path
  end

  private

  def album_user_params
    params.require(:album_user).permit(:album_id)
  end
end
