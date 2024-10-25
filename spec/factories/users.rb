FactoryBot.define do
  factory :user do
    
    nickname               {Faker::Name.initials(number: 2) }
    email                  {Faker::Internet.email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    last_name_kanji        { '漢字' }
    first_name_kanji       { '漢字' }
    last_name_kana         { 'カタカナ' }
    first_name_kana        { 'カタカナ' }
    birth_day              { Faker::Date.birthday }
    

  end
end