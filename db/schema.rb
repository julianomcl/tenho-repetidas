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

ActiveRecord::Schema.define(version: 20170620193516) do

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.string   "editor"
    t.integer  "total"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "albums_users", force: :cascade do |t|
    t.integer "album_id"
    t.integer "user_id"
    t.index ["album_id"], name: "index_albums_users_on_album_id"
    t.index ["user_id"], name: "index_albums_users_on_user_id"
  end
  
  create_table "fig_repetidas", force: :cascade do |t|
    t.integer "album_id"
    t.integer "user_id"
    t.index ["album_id"], name: "index_fig_repetidas_on_album_id"
    t.index ["user_id"], name: "index_fig_repetidas_on_user_id"
  end


  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "mobile"
    t.date     "birthday"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "telegram"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
