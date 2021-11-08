class AlbumsController < ApplicationController
  def index
    invited_album_ids = current_user.album_users.pluck(:album_id)
    showable_album_ids = current_user.albums.ids + invited_album_ids
    @albums = Album.where(id: showable_album_ids)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  private

  def album_params
    params.require(:album).permit(:user_id, :album_name, :birthday)
  end
end
