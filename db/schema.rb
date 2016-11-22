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

ActiveRecord::Schema.define(version: 20161122060238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payments", force: :cascade do |t|
    t.date     "startDate"
    t.date     "endDate"
    t.string   "total"
    t.integer  "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_payments_on_users_id", using: :btree
  end

  create_table "receipts", force: :cascade do |t|
    t.string   "type"
    t.date     "date"
    t.string   "concept"
    t.float    "subtotal"
    t.float    "total"
    t.float    "iva"
    t.string   "xml"
    t.integer  "users_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "user_email"
    t.string   "emisor"
    t.string   "rfcEmisor"
    t.string   "receptor"
    t.string   "rfcReceptor"
    t.index ["users_id"], name: "index_receipts_on_users_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "lastName"
    t.string   "phone"
    t.string   "accountStatus"
    t.string   "rfc"
    t.string   "state"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "payments", "users", column: "users_id"
  add_foreign_key "receipts", "users", column: "users_id"
end
