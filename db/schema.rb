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

ActiveRecord::Schema.define(version: 20131018080056) do

  create_table "item_files", force: true do |t|
    t.integer  "item_id"
    t.integer  "storage_id"
    t.string   "directory"
    t.integer  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_files", ["item_id"], name: "index_item_files_on_item_id"
  add_index "item_files", ["storage_id"], name: "index_item_files_on_storage_id"

  create_table "item_props", force: true do |t|
    t.integer  "item_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_props", ["item_id"], name: "index_item_props_on_item_id"

  create_table "item_tags", force: true do |t|
    t.integer  "item_id"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_tags", ["item_id"], name: "index_item_tags_on_item_id"

  create_table "item_thumbnails", force: true do |t|
    t.integer  "item_id"
    t.integer  "time_sec"
    t.string   "image_filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_thumbnails", ["item_id"], name: "index_item_thumbnails_on_item_id"

  create_table "items", force: true do |t|
    t.string   "filename"
    t.integer  "file_size",       limit: 8
    t.datetime "file_created_at"
    t.datetime "file_updated_at"
    t.string   "file_hash"
    t.string   "format"
    t.string   "title"
    t.string   "subtitle"
    t.string   "number"
    t.datetime "released_at"
    t.integer  "duration_sec"
    t.text     "description"
    t.text     "log"
    t.integer  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storages", force: true do |t|
    t.string   "name"
    t.string   "path"
    t.string   "description"
    t.integer  "device"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
