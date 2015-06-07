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

ActiveRecord::Schema.define(version: 20150606230934) do

  create_table "comments", force: :cascade do |t|
    t.string   "reply"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forums", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "forums", ["title"], name: "index_forums_on_title", unique: true

  create_table "polls", force: :cascade do |t|
    t.text     "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problems", force: :cascade do |t|
    t.string   "doubt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "problems", ["created_at"], name: "index_problems_on_user_id_and_created_at"

  create_table "qnas", force: :cascade do |t|
    t.string   "ques"
    t.string   "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.string   "city"
    t.string   "state"
    t.boolean  "admin"
    t.string   "name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vote_options", force: :cascade do |t|
    t.string   "title"
    t.integer  "poll_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "votes_count", default: 0, null: false
  end

  add_index "vote_options", ["poll_id"], name: "index_vote_options_on_poll_id"

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vote_option_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id"
  add_index "votes", ["vote_option_id", "user_id"], name: "index_votes_on_vote_option_id_and_user_id", unique: true
  add_index "votes", ["vote_option_id"], name: "index_votes_on_vote_option_id"

end
