class OrderAddress

  include ActiveModel::Model
  attr_accessor :token, :post_cord, :city, :address, :building_name, :phone_number, :prefecture_id, :item_id, :user_id

  with_options presence: { message: "can't be blak" } do
    validates :token
    validates :post_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :prefecture_id
    validates :phone_number, format: { with: /\d{11}/, message: "is invalid. Within 11 digits"} 
  end

  validates :city, presence: { message: "can't be blank" }
  validates :address, presence: { message: "can't be blank" }

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create( post_cord: post_cord, city: city, address: address, prefecture_id: prefecture_id, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end