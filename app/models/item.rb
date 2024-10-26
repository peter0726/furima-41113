class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery_time

  #空の投稿を保存できないようにする
  validates :title, presence: true
  validates :description, presence: true
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



  belongs_to :user
  has_one_attached :image



end
