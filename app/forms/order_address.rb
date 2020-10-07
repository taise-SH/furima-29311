class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :post_cord, :city, :address, :building_name, :phone_number, :prefecture_id, :item_id, :user_id

  with_options presence: { message: "を空白にすることはできません" } do
    validates :token
    validates :post_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は無効です. ハイフンが含まれていません' }
    validates :city
    validates :address
    validates :prefecture_id, numericality: { other_than: 0, message: "を空白にすることはできません" }
    validates :phone_number, format: { with: /\d{11}/, message: 'は無効です. 11桁いないではありません' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_cord: post_cord, city: city, address: address, prefecture_id: prefecture_id, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
