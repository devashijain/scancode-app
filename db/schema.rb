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

ActiveRecord::Schema.define(version: 2020_10_20_062427) do

  create_table "scans", force: :cascade do |t|
    t.text "invoice_number"
    t.text "transporter_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.varchar "email", limit: 255, default: "", null: false
    t.varchar "email", limit: 255, default: "", null: false
    t.varchar "encrypted_password", limit: 255, default: "", null: false
    t.varchar "encrypted_password", limit: 255, default: "", null: false
    t.varchar "reset_password_token", limit: 255
    t.varchar "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at", precision: 7
    t.datetime "reset_password_sent_at", precision: 7
    t.datetime "remember_created_at", precision: 7
    t.datetime "remember_created_at", precision: 7
    t.integer "sign_in_count", default: 0, null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: 7
    t.datetime "current_sign_in_at", precision: 7
    t.datetime "last_sign_in_at", precision: 7
    t.datetime "last_sign_in_at", precision: 7
    t.varchar "current_sign_in_ip", limit: 255
    t.varchar "current_sign_in_ip", limit: 255
    t.varchar "last_sign_in_ip", limit: 255
    t.varchar "last_sign_in_ip", limit: 255
    t.datetime "created_at", precision: 7, null: false
    t.datetime "created_at", precision: 7, null: false
    t.datetime "updated_at", precision: 7, null: false
    t.datetime "updated_at", precision: 7, null: false
    t.varchar "authentication_token", limit: 30
    t.varchar "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, where: "([authentication_token] IS NOT NULL)"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, where: "([reset_password_token] IS NOT NULL)"
  end

end
