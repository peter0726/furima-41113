class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :items
  belongs_to :users


  validates :token, presence: true



end
