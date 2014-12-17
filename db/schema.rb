# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141217202018) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_events", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "event_id"
  end

  add_index "categories_events", ["category_id", "event_id"], name: "index_categories_events_on_category_id_and_event_id"
  add_index "categories_events", ["event_id"], name: "index_categories_events_on_event_id"

  create_table "events", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.text     "venue"
    t.text     "address"
    t.date     "start_date"
    t.date     "end_date"
    t.time     "time"
    t.time     "start_time"
    t.time     "end_time"
    t.time     "all_day"
    t.text     "website"
    t.text     "image"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "latitude",    precision: 9, scale: 6
    t.decimal  "longitude",   precision: 9, scale: 6
  end

  create_table "searches", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "crypted_password"
    t.string   "salt"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

end
