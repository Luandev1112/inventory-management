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

ActiveRecord::Schema.define(version: 2019_06_13_112016) do

  create_table "allotments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "dealloted_at"
    t.integer "allotment_quantity"
    t.index ["item_id"], name: "index_allotments_on_item_id"
    t.index ["user_id"], name: "index_allotments_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "manufacturer"
    t.string "manufacturer_email"
    t.string "manufacturer_office"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "issues", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.text "issue_description"
    t.datetime "solved_at"
    t.text "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_issues_on_item_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "brand_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "in_stock"
    t.decimal "price"
    t.integer "minimum_required_stock"
    t.integer "procurement_time_in_weeks"
    t.string "quantity"
    t.integer "total_stock"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "mobile_no"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
