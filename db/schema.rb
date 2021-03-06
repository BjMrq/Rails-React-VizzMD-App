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

ActiveRecord::Schema.define(version: 2019_11_10_155709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bodies", force: :cascade do |t|
    t.bigint "patient_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "traitment"
    t.date "date_data_capture"
    t.index ["patient_id"], name: "index_bodies_on_patient_id"
  end

  create_table "muscles", force: :cascade do |t|
    t.bigint "body_id"
    t.string "name"
    t.integer "force_right", default: 0
    t.integer "force_left", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body_id"], name: "index_muscles_on_body_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "hospital_patient_id"
    t.integer "height"
    t.integer "weight"
    t.string "gender"
    t.text "notes"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_of_birth"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "reflexes", force: :cascade do |t|
    t.bigint "body_id"
    t.string "name"
    t.integer "reflex_right", default: 0
    t.integer "reflex_left", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body_id"], name: "index_reflexes_on_body_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "surname"
    t.boolean "admin", default: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bodies", "patients"
  add_foreign_key "muscles", "bodies"
  add_foreign_key "patients", "users"
  add_foreign_key "reflexes", "bodies"
end
