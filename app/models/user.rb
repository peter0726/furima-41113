class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' }
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'はカタカナで入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'はカタカナで入力してください' }
  validates :birth_day, presence: true


  validate :password_complexity


  has_many :items


  private

  def password_complexity
    if password.present? && !password.match(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)
      errors.add :password, "は英字と数字の両方を含める必要があります"
    end
  end

end
