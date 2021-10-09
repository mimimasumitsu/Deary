class CommentsController < ApplicationController
  def create
    photo = Photo.find(params[:photo_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.photo_id = photo.id
    comment.save
    album = Album.find(params[:album_id])
    redirect_to album_photo_path(album, photo)
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to album_photo_path(params[:album_id], params[:photo_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
