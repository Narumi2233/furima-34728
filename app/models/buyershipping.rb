class Buyershipping
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code,:prefecture_id,:city,:address,:building,:telephone,:buyer

  with_options presence: true do
    validates :user_id
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :building
    validates :buyer
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

    def save
      buyer = Buyer.create(user: user, item: item)
      Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, buyer: buyer.id)
    end
end

# コントローラー  buyersshipping - Buyer     ほぞん
#                              - Shipping  ほぞん

# itemsコントローラー itemsもでる- itemsてーぶる
