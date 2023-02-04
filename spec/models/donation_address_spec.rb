require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @donation_address = FactoryBot.build(:donation_address, user_id: @user.id)
  end

  describe "新規寄付" do
    context "内容に問題がない場合" do
      it "すべての値が正しく入力されていれば保存できる" do
        expect(@donation_address).to be_valid
      end
      it "cityは空でも保存できる" do
        @donation_address.city = ""
        expect(@donation_address).to be_valid
      end
      it "house_numberは空でも保存できる" do
        @donation_address.house_number = ""
        expect(@donation_address).to be_valid
      end
      it "building_nameは空でも保存できる" do
        @donation_address.building_name = ""
        expect(@donation_address).to be_valid
      end
    end
    context "内容に問題がある場合" do
      it "postal_codeが空だと保存できない" do
        @donation_address.postal_code = ""
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it "postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない" do
        @donation_address.postal_code = "1234567"
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it "prefectureを選択していないと保存できない" do
        @donation_address.prefecture = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "priceが空だと保存できない" do
        @donation_address.price = ""
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include "Price can't be blank"
      end
      it "priceが全角数字だと保存できない" do
        @donation_address.price = "１００"
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include "Price is invalid"
      end
      it "priceが1円未満では保存できない" do
        @donation_address.price = 0
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include "Price is invalid"
      end
      it "priceが1,000,000円を超過すると保存できない" do
        @donation_address.price = 2000000
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include "Price is invalid"
      end
      it "userが紐付いていないと保存できない" do
        @donation_address.user_id = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include "User can't be blank"
      end
    end
  end
end
