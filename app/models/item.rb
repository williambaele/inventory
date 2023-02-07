class Item < ApplicationRecord
  has_one :sale
  validates :name, presence: true
  validates :sku, presence: true
  validates :size, presence: true
  validates :retail, presence: true
  validates :purchase_date, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_sku,
  against: [ :sku, :name, :brand ],
  using: {
    tsearch: { prefix: true }
  }
end
