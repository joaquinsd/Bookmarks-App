# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_18_140643) do

  create_table "bookmark_categories", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "bookmark_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bookmark_id"], name: "index_bookmark_categories_on_bookmark_id"
    t.index ["category_id"], name: "index_bookmark_categories_on_category_id"
  end

  create_table "bookmark_types", force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "bookmark_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bookmark_id"], name: "index_bookmark_types_on_bookmark_id"
    t.index ["type_id"], name: "index_bookmark_types_on_type_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.boolean "public"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookmark_categories", "bookmarks"
  add_foreign_key "bookmark_categories", "categories"
  add_foreign_key "bookmark_types", "bookmarks"
  add_foreign_key "bookmark_types", "types"
  add_foreign_key "categories", "categories"
end
