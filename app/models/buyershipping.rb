class Buyershipping
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code,:prefecture_id,:city,:address,:building,:telephone,:buyer,:token

  with_options presence: true do
    validates :user_id
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :building
    validates :telephone
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

    def save
      buyer = Buyer.create(user_id: user_id, item_id: item_id)
      Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,telephone: telephone ,building: building, buyer_id: buyer.id)
    end
end

# コントローラー  buyersshipping - Buyer     ほぞん
#                              - Shipping  ほぞん

# itemsコントローラー itemsもでる- itemsてーぶる
