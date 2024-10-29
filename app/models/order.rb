class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :items
  belongs_to :users
  has_one :information


  #validates :token, presence: true



end
