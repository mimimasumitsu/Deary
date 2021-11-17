class Album < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :album_users, dependent: :destroy

  validates :album_name, presence: true
  validates :birthday, presence: true

  def age_char
    now_year_birthday = Date.new(Date.today.year, birthday.month, birthday.day)
    today = Date.today
    age = today.year - birthday.year
    if today.month < birthday.month or (today.month == birthday.month and today.day < birthday.day)
      age -= 1 # まだ誕生日を迎えていない
    end
    if today > now_year_birthday # 今年誕生日を迎えてる
      month = (today - now_year_birthday) / 30
    else # 迎えてない
      month = 12 - (birthday.month - Date.today.month)
      month = month - 1 if birthday.month == Date.today.month
    end

    "#{ age }歳 #{ month.floor }ヶ月"
  end
end
