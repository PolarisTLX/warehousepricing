class Customer < ApplicationRecord
  validates :name, presence: true
  validates_inclusion_of :charge_percent_of_value, in: 0..100
  validates_inclusion_of :general_discount_percent, in: 0..100

  has_many :tiers

  def calculate_cost
    flat_fee_per_item = self.quantity_of_items * self.flat_fee_per_item
    charge_per_square_foot = self.quantity_of_items * self.sqr_ft_per_item
    charge_percent_value = self.quantity_of_items * self.value_per_item
    
    total_cost = flat_fee_per_item + charge_per_square_foot + charge_percent_value
    total_cost = total_cost * ((100 - self.general_discount_percent.to_f)/100)
  end

end
