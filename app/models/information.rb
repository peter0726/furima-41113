class Information < ApplicationRecord
  belongs_to :order

  # 空の投稿を保存できないようにする
  # validates :postal_code, presence: true
  # validates :city, presence: true
  # validates :house_number, presence: true
  # validates :phone_number, presence: true

  # ジャンルの選択が「---」の時は保存できないようにする
  # validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end
