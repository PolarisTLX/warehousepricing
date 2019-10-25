# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_25_001746) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.integer "quantity_of_items", default: 0
    t.integer "value_per_item", default: 0
    t.integer "sqr_ft_per_item", default: 1
    t.integer "flat_fee_per_item", default: 20
    t.integer "charge_per_square_foot", default: 0
    t.integer "charge_percent_of_value", default: 0
    t.integer "general_discount_percent", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tiers", force: :cascade do |t|
    t.integer "stack_level"
    t.integer "start_quantity"
    t.integer "end_quantity"
    t.integer "tier_discount_percent", default: 0
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_tiers_on_customer_id"
  end

end
