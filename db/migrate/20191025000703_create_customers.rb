class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :quantity_of_items, default: 0
      t.integer :value_per_item, default: 0
      t.integer :sqr_ft_per_item, default: 1
      t.integer :flat_fee_per_item, default: 20
      t.integer :charge_per_square_foot, default: 0
      t.integer :charge_percent_of_value, default: 0
      t.integer :general_discount_percent, default: 0

      t.timestamps
    end
  end
end
