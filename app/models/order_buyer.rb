class OrderBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :order_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :municipalities, :address, :telephone_number, :item_id, :user_id, :token
  end
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :telephone_number, presence: true, format: {with: /\A[0-9]+\z/, maxlength: 11, message: "は半角数字のみ、ハイフンなしで入力して下さい"}
  validates :telephone_number, length: { minimum: 10, maximum: 11, message: "電話番号は10文字以上、11文字以下で入力してください" }

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Buyer.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
    end
end