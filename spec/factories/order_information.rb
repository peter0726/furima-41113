FactoryBot.define do
  factory :order_information do
    postal_code        { '123-4567' }
    prefecture_id      { 2 }
    city               { '横浜市' }
    house_number       { '1-1-1' }
    building_name      { '寮112' }
    phone_number       { '09012345678' }
    token              { 'gjkaklj;ghjdhjdahjrgjsdgdsgdsg' }
  end
end
