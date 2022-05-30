class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :buyer
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_days


  validates :title, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 0 } 
  validates :status_id, numericality: { other_than: 0 } 
  validates :delivery_fee_id, numericality: { other_than: 0 } 
  validates :prefecture_id, numericality: { other_than: 0 } 
  validates :delivery_days_id, numericality: { other_than: 0 } 
  validates :price, numericality: true ,inclusion: { in: 300..9999999 },format: { with: /\A[0-9]+\z/ }
end