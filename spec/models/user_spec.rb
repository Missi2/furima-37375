require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない場合' do
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
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字のみのパスワードでは登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'passwordが数字のみのパスワードでは登録できない' do
        @user.password = '123123123'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'passwordに全角文字が含まれていると登録できない' do
        @user.password = 'テスト123'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数のみ定義できます')
      end
      it 'passwordとpassword_confirmationが一致していなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角の漢字・ひらがな・カタカナで入力されていない場合には登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角文字を使用してください')
        @user.first_name = 'TEST'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角文字を使用してください')
        @user.first_name = 'てすと'
        expect(@user).to be_valid
        @user.first_name = 'テスト'
        expect(@user).to be_valid
        @user.first_name = '手酢戸'
        expect(@user).to be_valid
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角の漢字・ひらがな・カタカナで入力されていない場合には登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角文字を使用してください')
        @user.last_name = 'TEST'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角文字を使用してください')
        @user.last_name = 'てすと'
        expect(@user).to be_valid
        @user.last_name = 'テスト'
        expect(@user).to be_valid
        @user.last_name = '手酢戸'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが全角のカタカナ以外では登録できない' do
        @user.first_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カナを使用してください')
        @user.first_name_kana = '手酢戸'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カナを使用してください')
        @user.first_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カナを使用してください')
      end
      it 'first_name_kanaは半角のカタカナでは登録できない' do
        @user.first_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カナを使用してください')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角のカタカナ以外では登録できない' do
        @user.last_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カナを使用してください')
        @user.last_name_kana = '手酢戸'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カナを使用してください')
        @user.last_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カナを使用してください')
      end
      it 'last_name_kanaは半角のカタカナでは登録できない' do
        @user.last_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カナを使用してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
