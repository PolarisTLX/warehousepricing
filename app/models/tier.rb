class Tier < ApplicationRecord
  belongs_to :customer
  validates :start_quantity, presence: true
  # validates : end_quantity, presence: true
end
