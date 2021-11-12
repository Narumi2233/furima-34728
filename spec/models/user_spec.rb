require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録出来る時' do
      it '全ての項目が入力されていれば登録出来る' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
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
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスに＠を含まない場合は登録できない' do
      @user.email = 1q2w.com
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は英数字混合にしてください')
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '1111111'
      @user.password_confirmation = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は英数字混合にしてください')
    end
    it '姓(全角）が空だと登録できない' do
      @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.last_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name には全角文字を使用してください')
    end
    it '名（全角）が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'huga'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name には全角文字を使用してください')
    end
    it '姓（カナ）が空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name = 'あ愛a@'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name にはカタカナを使用してください')
    end
    it '名（カナ）が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name = 'あ愛a@'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name にはカタカナを使用してください')
    end
    it '生年月日が空だと登録できない' do
      @user.birthday = ''
      @user.valid?
    end
  end
end
end
