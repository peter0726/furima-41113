class Order < ApplicationRecord
  aftr_accessor :token
  belongs_to :items
  belongs_to :users



  validates :price, presence: true
    # 価格の設定を300円～999999円の範囲にする
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    # 価格の設定を半角の数字のみにする
    validates :price, numericality: { only_integer: true, message: 'must be an integer' }

end
