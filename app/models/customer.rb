class Customer < ApplicationRecord
  validates :name, presence: true
  validates_inclusion_of :charge_percent_of_value, in: 0..100
  validates_inclusion_of :general_discount_percent, in: 0..100

  has_many :tiers

  def calculate_cost

    if self.tiers.length == 0
      flat_fee_per_item = self.quantity_of_items * self.flat_fee_per_item
      charge_per_square_foot = self.quantity_of_items * self.sqr_ft_per_item
      charge_percent_value = self.quantity_of_items * self.value_per_item
      
      total_cost = flat_fee_per_item + charge_per_square_foot + charge_percent_value
      total_cost = total_cost * ((100 - self.general_discount_percent.to_f)/100)
    else
      total_cost = 0
      self.tiers.each do |tier|         
        if self.quantity_of_items < tier.start_quantity
          puts "quantity_of_items #{self.quantity_of_items} < tier.start_quantity:#{tier.start_quantity}"
          next
        elsif tier.end_quantity.nil? || self.quantity_of_items < tier.end_quantity
          quantity_in_tier = self.quantity_of_items - tier.start_quantity

          flat_fee_per_item = quantity_in_tier * self.flat_fee_per_item
          charge_per_square_foot = quantity_in_tier * self.sqr_ft_per_item
          charge_percent_value = quantity_in_tier * self.value_per_item
          
          tier_cost = flat_fee_per_item + charge_per_square_foot + charge_percent_value
          tier_cost = tier_cost * ((100 - tier.tier_discount_percent.to_f)/100)
          puts "tier_cost: #{tier_cost}"

          total_cost = total_cost + tier_cost
        else
          tier_range = tier.end_quantity - tier.start_quantity

          flat_fee_per_item = tier_range * self.flat_fee_per_item
          charge_per_square_foot = tier_range * self.sqr_ft_per_item
          charge_percent_value = tier_range * self.value_per_item
          
          tier_cost = flat_fee_per_item + charge_per_square_foot + charge_percent_value
          tier_cost = tier_cost * ((100 - tier.tier_discount_percent.to_f)/100)
          puts "tier_cost: #{tier_cost}"

          total_cost = total_cost + tier_cost
        end

      end
      total_cost
    end

  end

end
