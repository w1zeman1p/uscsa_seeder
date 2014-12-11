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

ActiveRecord::Schema.define(version: 20141211233713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: true do |t|
    t.integer  "team_id"
    t.string   "bib_number",                null: false
    t.boolean  "eligible",   default: true
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "sex",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "athletes", ["team_id"], name: "index_athletes_on_team_id", using: :btree

  create_table "events", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meet_id"
    t.datetime "start_at"
    t.integer  "sex",        default: 0
    t.integer  "discipline", default: 0
  end

  create_table "meets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name",         null: false
    t.string   "abbreviation", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.integer  "school_id"
    t.integer  "sex",        default: 0
    t.integer  "discipline", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["school_id"], name: "index_teams_on_school_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "officer",                default: false
    t.boolean  "captain",                default: false
    t.boolean  "admin",                  default: false
    t.integer  "athlete_id"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
