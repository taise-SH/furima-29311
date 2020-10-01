require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入時の情報' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全ての情報が保存できるとき' do
      expect(@order_address).to be_valid
    end

    it 'post_cordが空だと保存できない' do
      @order_address.post_cord = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post cord can't be blak", "Post cord is invalid. Include hyphen(-)")
    end

    it 'post_cordはハイフンがないと保存できない' do
      @order_address.post_cord = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post cord is invalid. Include hyphen(-)")
    end

    it 'purefectureを選択されていないと保存できない' do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空だと保存できない' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blak")
    end

    it 'addressが空だと保存できない' do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blak")
    end

    it 'building_nameは空でも保存できる' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end

    it 'phone_numberが空だと保存できない' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blak", "Phone number is invalid. Within 11 digits")
    end

    it 'phone_numberはハイフンが含まれていると保存できない' do
      @order_address.phone_number = "080-1234-5678"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid. Within 11 digits")
    end

    it 'phone_numberは12以上では保存できない' do
      @order_address.phone_number = "080999933333"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include()
    end
  end
end
