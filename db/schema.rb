# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_17_171447) do

  create_table "answers", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "attempt_id"
    t.bigint "question_id"
    t.boolean "alt_1", default: false, null: false
    t.boolean "alt_2", default: false, null: false
    t.boolean "alt_3", default: false, null: false
    t.boolean "alt_4", default: false, null: false
    t.boolean "alt_5", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attempt_id"], name: "answers2attempt"
    t.index ["question_id"], name: "answers2question"
    t.index ["user_id"], name: "answers2user"
  end

  create_table "attempts", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quiz_id"
    t.datetime "time_started"
    t.datetime "time_ended"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "attempts2quiz"
    t.index ["user_id"], name: "attempts2user"
  end

  create_table "questions", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quiz_id"
    t.string "question_text"
    t.string "alt_1"
    t.boolean "check_1", default: false, null: false
    t.string "alt_2"
    t.boolean "check_2", default: false, null: false
    t.string "alt_3"
    t.boolean "check_3", default: false, null: false
    t.string "alt_4"
    t.boolean "check_4", default: false, null: false
    t.string "alt_5"
    t.boolean "check_5", default: false, null: false
    t.integer "points"
    t.integer "sort_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "questions2quiz"
    t.index ["user_id"], name: "questions2user"
  end

  create_table "quizzes", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.integer "pass_threshold", default: 40, null: false
    t.integer "allowed_time", default: 20, null: false
    t.boolean "allow_retake", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "quizzes2user"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "attempts", name: "answers2attempt"
  add_foreign_key "answers", "questions", name: "answers2question"
  add_foreign_key "answers", "users", name: "answers2user"
  add_foreign_key "attempts", "quizzes", name: "attempts2quiz"
  add_foreign_key "attempts", "users", name: "attempts2user"
  add_foreign_key "questions", "quizzes", name: "questions2quiz"
  add_foreign_key "questions", "users", name: "questions2user"
  add_foreign_key "quizzes", "users", name: "quizzes2user"
end
