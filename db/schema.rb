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

ActiveRecord::Schema.define(version: 2019_03_26_045031) do

  create_table "abilities", force: :cascade do |t|
    t.integer "overwatch_id"
    t.string "name"
    t.text "description"
    t.boolean "is_ultimate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "abilities_heros", force: :cascade do |t|
    t.integer "ability_id"
    t.integer "hero_id"
    t.index ["ability_id"], name: "index_abilities_heros_on_ability_id"
    t.index ["hero_id"], name: "index_abilities_heros_on_hero_id"
  end

  create_table "heros", force: :cascade do |t|
    t.integer "overwatch_id"
    t.string "name"
    t.string "real_name"
    t.integer "health"
    t.integer "armour"
    t.integer "shield"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
