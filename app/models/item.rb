class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :prefecture

  validates :name, :explanation, :image, :price ,presence: true
  validates :category_id, :condition_id, :postage_payer_id, :prefecture_id, :delivery_day_id, numericality: { other_than: 0 }
  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
