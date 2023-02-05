class Item < ApplicationRecord
  validates :name, presence: true
  validates :sku, presence: true
  validates :size, presence: true
  validates :retail, presence: true
  validates :purchase_date, presence: true
end
