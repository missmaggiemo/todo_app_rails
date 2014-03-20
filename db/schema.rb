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

ActiveRecord::Schema.define(version: 20140320195028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lists", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "list_id"
    t.integer  "todo_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["list_id", "todo_item_id"], name: "index_relationships_on_list_id_and_todo_item_id", unique: true, using: :btree
  add_index "relationships", ["list_id"], name: "index_relationships_on_list_id", using: :btree
  add_index "relationships", ["todo_item_id"], name: "index_relationships_on_todo_item_id", using: :btree

  create_table "todo_items", force: true do |t|
    t.string   "description"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "list_id"
    t.text     "notes"
  end

end
