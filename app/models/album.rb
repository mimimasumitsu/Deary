class Album < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :album_users, dependent: :destroy

  validates :album_name, presence: true
  validates :birthday, presence: true
end
