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

ActiveRecord::Schema.define(version: 20160416014835) do

  create_table "bolhas", force: :cascade do |t|
    t.string   "title",                limit: 255
    t.string   "l_name",               limit: 255
    t.string   "r_name",               limit: 255
    t.text     "content",              limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "l_image_file_name",    limit: 255
    t.string   "l_image_content_type", limit: 255
    t.integer  "l_image_file_size",    limit: 4
    t.datetime "l_image_updated_at"
    t.string   "r_image_file_name",    limit: 255
    t.string   "r_image_content_type", limit: 255
    t.integer  "r_image_file_size",    limit: 4
    t.datetime "r_image_updated_at"
  end

end
