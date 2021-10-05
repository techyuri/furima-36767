class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :delivery
  has_one :buyer
  has_one_attached :image

end

with_options numericality: { other_than: 1, message: "can't be blank" } do
  validates :category_id
  validates :state_id
  validates :burden_id
  validates :area_id
  validates :delinvery_id
end