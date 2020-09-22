require 'rails_helper'

describe Item, User do
  before do
    @user_id = FactoryBot.create(:user)
  end
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "name, explanation, image, price, category, condition, delivery_day, postage_payer, prefectureが存在すれば出品できる" do
        expect(@item).to be_valid
      end

    context '商品出品ができないとき' do
      it "nameが空では出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "explanationが空では出品できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "imageが空では出品できない" do 
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "categoryが--では出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it "conditionが--では出品できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end

      it "delivery_dayが--では出品できない" do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 0")
      end

      it "postage_payerが--では出品できない" do
        @item.postage_payer_id  = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer must be other than 0")
      end

      it "prefectureが--では出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it "priceが空では出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが全角数字では出品できない" do
        @item.price = "４４４４"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが300~9999999円でなければ出品できない" do
        @item.price = "22"
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 333")
      end
    end
  end
end
