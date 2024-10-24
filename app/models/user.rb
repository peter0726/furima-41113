class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :last_name_kanji, presence: true
         validates :first_name_kanji, presence: true
         validates :last_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :birth_day, presence: true


         validate :password_complexity

         private

         def password_complexity
           if password.present? && !password.match(/^(?=.*[a-zA-Z])(?=.*[0-9])/)
             errors.add :password, "は英字と数字の両方を含める必要があります"
           end
         end

end
