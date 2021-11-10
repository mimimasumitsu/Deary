class Photo < ApplicationRecord
  belongs_to :album
  attachment :image
  has_many :comments, dependent: :destroy

  validates :image, presence: true
  validates :comment, presence: true
end
