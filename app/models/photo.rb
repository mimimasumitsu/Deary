class Photo < ApplicationRecord
  belongs_to :album
  attachment :image
  has_many :comments, dependent: :destroy
end
