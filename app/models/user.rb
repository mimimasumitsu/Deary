class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :albums, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :album_users, dependent: :destroy

  validates :name, presence: true, length: { in: 2..15 }
end
