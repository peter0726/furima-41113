FactoryBot.define do
  factory :item do
    association :user
    title { '商品名' }
    description { '商品説明' }
    category_id { 2 }
    quality_id { 2 }
    postage_id { 2 }
    prefecture_id { 2 }
    delivery_time_id { 2 }
    price { 400 }


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
