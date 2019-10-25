class Tier < ApplicationRecord
  belongs_to :customer
  validates :start_quantity, presence: true
  validates_inclusion_of :tier_discount_percent, in: 0..100
end
