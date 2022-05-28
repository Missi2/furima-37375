class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :item_name, :explanatory, :image, :category_id, :condition_id, :delivery_id, :prefecture_id, :shipping_day_id, :image, :price, presence: true

  validates :category_id, :condition_id, :delivery_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :price, numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true, message: "は ¥300~9,999,999 の間で半角数字で指定してください" }

end