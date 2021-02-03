require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全てが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do

      it 'nameが空だと登録できない' do
        @user.name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前 translation missing: ja.activerecord.errors.models.user.attributes.name.blank"
      end
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネーム translation missing: ja.activerecord.errors.models.user.attributes.nickname.blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレス translation missing: ja.activerecord.errors.models.user.attributes.email.blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード translation missing: ja.activerecord.errors.models.user.attributes.password.blank")
      end
      it 'profileが空では登録できない' do
        @user.profile = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("プロフィール translation missing: ja.activerecord.errors.models.user.attributes.profile.blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用） translation missing: ja.activerecord.errors.models.user.attributes.password_confirmation.confirmation")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include( 'パスワード translation missing: ja.activerecord.errors.models.user.attributes.password.invalid')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード translation missing: ja.activerecord.errors.models.user.attributes.password.invalid')
      end
      it 'emailで@が入っていなければ登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'メールアドレス translation missing: ja.activerecord.errors.models.user.attributes.email.invalid'
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレス translation missing: ja.activerecord.errors.models.user.attributes.email.taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード translation missing: ja.activerecord.errors.models.user.attributes.password.too_short')
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワード translation missing: ja.activerecord.errors.models.user.attributes.password.invalid")
      end
    end
  end
end
