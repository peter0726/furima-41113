class OrderInformation
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  validates :token, presence: true
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'must be 10 to 11 digits' }

  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    # order情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    Information.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                       building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
