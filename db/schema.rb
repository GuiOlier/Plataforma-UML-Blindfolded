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

ActiveRecord::Schema.define(version: 20170322175903) do

  create_table "cases", force: :cascade do |t|
    t.string   "namediagram", limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "cases", ["user_id"], name: "index_cases_on_user_id", using: :btree

  create_table "components", force: :cascade do |t|
    t.text     "descriptionsComponent", limit: 65535
    t.integer  "case_id",               limit: 4
    t.integer  "mold_id",               limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "components", ["case_id"], name: "index_components_on_case_id", using: :btree
  add_index "components", ["mold_id"], name: "index_components_on_mold_id", using: :btree

  create_table "connections", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "elements", force: :cascade do |t|
    t.string   "nameElem",        limit: 255
    t.text     "descriptionElem", limit: 65535
    t.integer  "machine_id",      limit: 4
    t.integer  "type_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "elements", ["machine_id"], name: "index_elements_on_machine_id", using: :btree
  add_index "elements", ["type_id"], name: "index_elements_on_type_id", using: :btree

  create_table "machines", force: :cascade do |t|
    t.string   "nameDiagram", limit: 255
    t.integer  "elemInitial", limit: 4
    t.integer  "elemEnd",     limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "machines", ["user_id"], name: "index_machines_on_user_id", using: :btree

  create_table "molds", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "relations", force: :cascade do |t|
    t.integer  "elemStart",     limit: 4
    t.integer  "elemEnd",       limit: 4
    t.integer  "case_id",       limit: 4
    t.integer  "connection_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "relations", ["case_id"], name: "index_relations_on_case_id", using: :btree
  add_index "relations", ["connection_id"], name: "index_relations_on_connection_id", using: :btree

  create_table "transitions", force: :cascade do |t|
    t.integer  "elemStart",       limit: 4
    t.integer  "elemEnd",         limit: 4
    t.text     "descriptionTran", limit: 65535
    t.integer  "machine_id",      limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "transitions", ["machine_id"], name: "index_transitions_on_machine_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cases", "users"
  add_foreign_key "components", "cases"
  add_foreign_key "components", "molds"
  add_foreign_key "elements", "machines"
  add_foreign_key "elements", "types"
  add_foreign_key "machines", "users"
  add_foreign_key "relations", "cases"
  add_foreign_key "relations", "connections"
  add_foreign_key "transitions", "machines"
end
