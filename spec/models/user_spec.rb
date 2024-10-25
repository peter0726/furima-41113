require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do 
      it 'nicknameとemail、passwordとpassword_confirmation、last_name_kanjiと first_name_kanji、last_name_kanaとfirst_name_kana、birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end



    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end


      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'すでに登録されているemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'aaaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end


      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordに半角数字がなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は英字と数字の両方を含める必要があります"
      end
      it 'passwordに半角英字がなければ登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は英字と数字の両方を含める必要があります"
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = 'aaaaa1'
        @user.password_confirmation = 'bbbbb2'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end


      it 'last_name_kanjiが空では登録できない' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kanji can't be blank"
      end
      it 'last_name_kanjiが全角でなければ登録できない' do
        @user.last_name_kanji = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kanji は全角文字で入力してください"
      end
      it 'first_name_kanjiが空では登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kanji can't be blank"
      end
      it 'first_name_kanjiが全角でなければ登録できない' do
        @user.first_name_kanji = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kanji は全角文字で入力してください"
      end



      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'last_name_kanaが全角でなければ登録できない' do
        @user.last_name_kana = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana はカタカナで入力してください"
      end
      it 'last_name_kanaがカタカナでなければ登録できない' do
        @user.last_name_kana = 'かたかな'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana はカタカナで入力してください"
      end


      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'first_name_kanaが全角でなければ登録できない' do
        @user.first_name_kana = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana はカタカナで入力してください"
      end
      it 'first_name_kanaがカタカナでなければ登録できない' do
        @user.first_name_kana = 'かたかな'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana はカタカナで入力してください"
      end



      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end


  end



end
