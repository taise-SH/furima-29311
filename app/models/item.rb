class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postage_payer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_day

  validates :name, :explanation, :image, :price ,presence: true
  validates :category_id, :condition_id, :postage_payer_id, :prefecture_id, :delivery_day_id, numericality: { other_than: 0 }
  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 333, less_than_or_equal_to: 9999999 }
end
