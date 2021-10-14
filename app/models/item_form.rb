class UserItem
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :area_id, :city, :house_number, :building, :phone_number, :postal_cord, :buyer_id

  with_options presence: true do
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/ }
    validates :phone_number, length: { maximum: 11 }
    validates :postal_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :token
  end

  def save
    buyer = Buyers.create(user_id: user_id, item_id: item_id)
    Address.create(area_id: area_id, city: city, address_line: address_line, building: building, phone_number: phone_number, postal_cord: postal_cord, buyer_id: buyer.id)
  end
end