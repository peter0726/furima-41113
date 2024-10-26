class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery_time
  belongs_to :user
  has_one_attached :image


  #空の投稿を保存できないようにする
  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :quality_id, presence: true
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_time_id, presence: true
  validates :price, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :quality_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_time_id, numericality: { other_than: 1 , message: "can't be blank"} 

  #価格の設定を300円～999999円の範囲にする
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  #価格の設定を半角の数字のみにする
  validates :price, format: { with: /\A[0-9]+\z/, message: 'must be a number using half-width digits only' }





end
