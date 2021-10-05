class Item < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :delivery
  has_one :buyer
  has_one_attached :image

end
