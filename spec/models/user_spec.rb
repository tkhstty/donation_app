require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "内容に問題がない場合" do
      it "すべての値が正しく入力されていれば保存できる" do
        expect(@user).to be_valid
      end
    end
    context "内容に問題がある場合" do
      it "nameが空だと保存できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it "nameが全角日本語でないと保存できない" do
        @user.name = "Suzuki Ichiro"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name is invalid. Input full-width characters"
      end
      it "name_readingが空だと保存できない" do
        @user.name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name reading can't be blank"
      end
      it "name_readingが全角カタカナでないと保存できない" do
        @user.name_reading = "すずきいちろう"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name reading is invalid. Input full-width katakana characters"
      end
      it "nicknameが空だと保存できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "nicknameが半角でないと保存できない" do
        @user.nickname = "イチロー"
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname is invalid. Input half-width characters"
      end
    end
  end
end
