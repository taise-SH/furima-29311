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
      it "name, explanation, image, priceが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    
      it "categoryが--以外ならば出品できる" do
        @item.category_id = 2
        expect(@item).to be_valid
      end

      it "conditionが--以外ならば出品できる" do
        @item.condition_id = 2
        expect(@item).to be_valid
      end

      it "delivery_dayが--以外ならば出品できる" do
        @item.delivery_day_id = 2
        expect(@item).to be_valid
      end

      it "postage_payerが--以外ならば出品できる" do
        @item.postage_payer_id = 2
        expect(@item).to be_valid
      end

      it "prefectureが--以外ならば出品できる" do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end

      it "priceが半角数字で333~9999999円なら出品できる" do
        @item.price = "4444"
        expect(@item).to be_valid
      end
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

      it "priceが333~9999999円でなければ出品できない" do
        @item.price = "22"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 333")
      end
    end
  end
end
