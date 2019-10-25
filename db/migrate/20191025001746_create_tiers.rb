class CreateTiers < ActiveRecord::Migration[5.2]
  def change
    create_table :tiers do |t|
      t.integer :stack_level
      t.integer :start_quantity
      t.integer :end_quantity
      t.integer :tier_discount_percent, default: 0
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
