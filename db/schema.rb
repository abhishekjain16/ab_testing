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

ActiveRecord::Schema.define(version: 20131216142126) do

  create_table "experiments", force: true do |t|
    t.string   "name"
    t.string   "selector"
    t.string   "path"
    t.string   "relative_path"
    t.integer  "total_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "success_selector"
    t.string   "success_method"
  end

  create_table "variations", force: true do |t|
    t.integer  "experiment_id"
    t.text     "data"
    t.integer  "render_count"
    t.integer  "success_count"
    t.string   "name"
    t.boolean  "status",        default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "variations", ["experiment_id"], name: "index_variations_on_experiment_id", using: :btree

end
