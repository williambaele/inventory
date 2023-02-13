class Sale < ApplicationRecord
  belongs_to :item
  validates :sale_date, presence: true
  validates :sale_price, presence: true
  validates :sale_platform, presence: true
end
