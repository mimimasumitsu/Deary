class Photo < ApplicationRecord
  belongs_to :album
  attachment :image
end
