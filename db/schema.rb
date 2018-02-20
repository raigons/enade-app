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

ActiveRecord::Schema.define(version: 20180219131019) do

  create_table "course_institutions", id: false, force: :cascade do |t|
    t.integer "institution_id", null: false
    t.integer "course_id", null: false
    t.float "score"
    t.float "student_average"
    t.index ["course_id", "institution_id"], name: "index_course_institutions_on_course_id_and_institution_id"
    t.index ["institution_id", "course_id"], name: "index_course_institutions_on_institution_id_and_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.float "general_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
