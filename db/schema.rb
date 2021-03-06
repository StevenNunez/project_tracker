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

ActiveRecord::Schema.define(version: 20160516015801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image"
    t.string   "github_username"
  end

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "github_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "heroku_url"
    t.integer  "account_id"
    t.string   "repo_name"
    t.integer  "cohort_id"
  end

  add_index "projects", ["account_id"], name: "index_projects_on_account_id", using: :btree
  add_index "projects", ["cohort_id"], name: "index_projects_on_cohort_id", using: :btree
  add_index "projects", ["repo_name"], name: "index_projects_on_repo_name", using: :btree

  create_table "rails_best_practice_violations", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "commit_hash"
    t.string   "violation"
    t.string   "message"
    t.string   "more_info_url"
    t.string   "file_name"
    t.integer  "line_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "rails_best_practice_violations", ["commit_hash"], name: "index_rails_best_practice_violations_on_commit_hash", using: :btree
  add_index "rails_best_practice_violations", ["project_id"], name: "index_rails_best_practice_violations_on_project_id", using: :btree

  create_table "rubycritic_criticisms", force: :cascade do |t|
    t.string   "commit_hash"
    t.json     "payload"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
  end

  add_index "rubycritic_criticisms", ["commit_hash"], name: "index_rubycritic_criticisms_on_commit_hash", using: :btree
  add_index "rubycritic_criticisms", ["project_id"], name: "index_rubycritic_criticisms_on_project_id", using: :btree

  add_foreign_key "projects", "accounts"
  add_foreign_key "projects", "cohorts"
  add_foreign_key "rails_best_practice_violations", "projects"
  add_foreign_key "rubycritic_criticisms", "projects"
end
