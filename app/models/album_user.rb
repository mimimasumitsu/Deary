class AlbumUser < ApplicationRecord
  belongs_to :user
  belongs_to :album

  validates :album_id, uniqueness: { scope: :user_id }
end
