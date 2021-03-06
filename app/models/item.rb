class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :prefecture

  validates :name, :explanation, :image, :price, presence: { message: "を空白にすることはできません" }
  validates :category_id, :condition_id, :postage_payer_id, :prefecture_id, :delivery_day_id, numericality: { other_than: 0, message: "を空白にすることはできません" }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'は数ではありません'}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300から9,999,999までです'}
end
