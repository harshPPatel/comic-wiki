# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_16_200621) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "site_detail_url"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters_issues", id: false, force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "issue_id", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "site_detail_url"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "volume_id", null: false
    t.index ["volume_id"], name: "index_issues_on_volume_id"
  end

  create_table "volumes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "start_year"
    t.string "site_detail_url"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "issues", "volumes"
end
