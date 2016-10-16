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

ActiveRecord::Schema.define(version: 20161016224137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payments", primary_key: "idPayment", force: :cascade do |t|
    t.date     "startDate"
    t.date     "endDate"
    t.string   "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", primary_key: "idReceipt", force: :cascade do |t|
    t.string   "type"
    t.date     "date"
    t.string   "concept"
    t.float    "subtotal"
    t.float    "total"
    t.float    "iva"
    t.string   "xml"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", primary_key: "idUser", force: :cascade do |t|
    t.string   "name"
    t.string   "lastName"
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.string   "accountState"
    t.boolean  "admin"
    t.string   "rfc"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
