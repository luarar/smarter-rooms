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

ActiveRecord::Schema.define(version: 2019_07_12_171313) do

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.integer "participants"
    t.datetime "valid_to"
    t.datetime "valid_from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.string "adress"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "long", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roomgoods", force: :cascade do |t|
    t.integer "room_id"
    t.integer "good_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_roomgoods_on_good_id"
    t.index ["room_id"], name: "index_roomgoods_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "floor"
    t.integer "capacity"
    t.integer "is_active", default: 1
    t.integer "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_rooms_on_building_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "birthdate"
    t.string "email"
    t.string "password"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
