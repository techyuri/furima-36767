class Item < ApplicationRecord
  belongs_to :user
  # has_one :buyer
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :category_id
    validates :state_id
    validates :delivery_id
    validates :burden_id
    validates :area_id
    validates :price, format: { with: /\A\d+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :delivery

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_id
    validates :area_id
    validates :burden_id
  end
end
