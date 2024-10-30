require 'rails_helper'

RSpec.describe OrderInformation, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_information = FactoryBot.build(:order_information, item_id: @item.id, user_id: @user.id )
  end

  describe '商品の購入' do
    context '購入できる場合' do
      it 'token、postal_code、prefecture_id、city、house_number、phone_numberが存在すれば登録できる' do
        expect(@order_information).to be_valid
      end
      it 'building_nameは空でも登録できる' do
        @order_information.building_name = ''
        expect(@order_information).to be_valid
      end
    end

    context '購入できない場合' do
      it 'tokenが空の場合は登録できないこと' do
        @order_information.token = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idが空の場合は登録できないこと' do
        @order_information.user_id = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空の場合は登録できないこと' do
        @order_information.item_id = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include "Item can't be blank"
      end
      it 'postal_codeがない場合は登録できないこと' do
        @order_information.postal_code = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeにハイフンがないと登録できないこと' do
        @order_information.postal_code = '1234567'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'postal_codeが全角数字だと登録できないこと' do
        @order_information.postal_code = '１２３-４５６７'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'postal_codeが3桁ハイフン4桁でない登録できないこと' do
        @order_information.postal_code = '1234-567'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'postal_codeが数字でない登録できないこと' do
        @order_information.postal_code = 'abc-defg'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'prefecture_idが--場合は登録できないこと' do
        @order_information.prefecture_id = 1
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityがない場合は登録できないこと' do
        @order_information.city = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include "City can't be blank"
      end

      it 'house_numberがない場合は登録できないこと' do
        @order_information.house_number = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberがない場合は登録できないこと' do
        @order_information.phone_number = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが半角でないと登録できないこと' do
        @order_information.phone_number = '０９０１２３４５６７８'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include 'Phone number must be 10 to 11 digits'
      end
      it 'phone_numberが数字でないと登録できないこと' do
        @order_information.phone_number = 'aaaaaaaaaaa'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include 'Phone number must be 10 to 11 digits'
      end
      it 'phone_numberにハイフンがあると登録できないこと' do
        @order_information.phone_number = '090-1234-5678'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include 'Phone number must be 10 to 11 digits'
      end
      it 'phone_numberが9字以下だと登録できないこと' do
        @order_information.phone_number = '090123456'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include 'Phone number must be 10 to 11 digits'
      end
      it 'phone_numberが12字以下だと登録できないこと' do
        @order_information.phone_number = '090123456789'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include 'Phone number must be 10 to 11 digits'
      end
    end
  end
end
