customers = Customer.create([
  { name: 'A', quantity_of_items: 0, value_per_item: 0, sqr_ft_per_item: 0, flat_fee_per_item: 20, charge_per_square_foot: 0, charge_percent_of_value: 0, general_discount_percent: 10 }, 
  { name: 'B', quantity_of_items: 0, value_per_item: 0, sqr_ft_per_item: 0, flat_fee_per_item: 20, charge_per_square_foot: 1, charge_percent_of_value: 0, general_discount_percent: 0 }, 
  { name: 'C', quantity_of_items: 0, value_per_item: 0, sqr_ft_per_item: 0, flat_fee_per_item: 20, charge_per_square_foot: 0, charge_percent_of_value: 5, general_discount_percent: 0 }, 
  { name: 'D', quantity_of_items: 0, value_per_item: 0, sqr_ft_per_item: 0, flat_fee_per_item: 20, charge_per_square_foot: 2, charge_percent_of_value: 0, general_discount_percent: 0 }
])

tiers = Tier.create([
  { customer_id: 4, stack_level: 1, start_quantity: 1, end_quantity: 100, tier_discount_percent: 5},
  { customer_id: 4, stack_level: 2, start_quantity: 101, end_quantity: 200, tier_discount_percent: 10},
  { customer_id: 4, stack_level: 3, start_quantity: 201, tier_discount_percent: 15},
])