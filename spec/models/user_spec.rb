require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context '新規登録がうまくいく時'do
     it '全ての入力が問題なく存在する' do
      expect(@user).to be_valid
     end
   end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailsに@が含まれていないと登録できない' do
        @user.email = 'abcd.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationの値が一致しないため登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '456def'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて半角で入力してください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて半角で入力してください')
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ＡＢＣ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて半角で入力してください')
      end
     
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが13文字以上では登録できない' do
        @user.password = 'abcde12345678'
        @user.password_confirmation = 'abcde12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 12 characters)')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが英字のみでは登録できない' do
        @user.last_name = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが英字のみでは登録できない' do
        @user.first_name = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'kana_last_nameはひらがなでは登録できない' do
        @user.kana_last_name = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name は全角（カタカナ）で入力してください')
      end
      it 'kana_last_nameは英字のみでは登録できない' do
        @user.kana_last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name は全角（カタカナ）で入力してください')
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'kana_first_nameはひらがなでは登録できない' do
        @user.kana_first_name = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name は全角（カタカナ）で入力してください')
      end
      it 'kana_first_nameは英字のみでは登録できない' do
        @user.kana_first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name は全角（カタカナ）で入力してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      
    end
 end
end
