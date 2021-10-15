class ItemForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :area_id, :city, :address_line, :building, :phone_number, :postal_code, :buyer, :token

  with_options presence: true do
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A[0-9]+\z/ }
    validates :phone_number, length: { maximum: 11 }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(area_id: area_id, city: city, address_line: address_line, building: building, phone_number: phone_number,
                   postal_code: postal_code, buyer_id: buyer.id)
  end
end
