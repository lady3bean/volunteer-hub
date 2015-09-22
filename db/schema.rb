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

ActiveRecord::Schema.define(version: 20150922153509) do

  create_table "addresses", force: :cascade do |t|
    t.string  "line1"
    t.string  "line2"
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.integer "addressable_id"
    t.string  "addressable_type"
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", unique: true

  create_table "follow_up_forms", force: :cascade do |t|
    t.string   "name",              null: false
    t.string   "email",             null: false
    t.string   "phone"
    t.boolean  "want_to_volunteer"
    t.boolean  "subscribe_to_sms"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
  end

  add_index "follow_up_forms", ["user_id"], name: "index_follow_up_forms_on_user_id"

  create_table "reg_forms", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "reg_forms", ["user_id"], name: "index_reg_forms_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username",                           null: false
    t.string   "email",                              null: false
    t.string   "password_digest"
    t.string   "token"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["token"], name: "index_users_on_token"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
