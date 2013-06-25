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
# It's strongly recommended to check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20130621073901) do

  create_table "artifacts", :force => true do |t|
    t.string   "name"
    t.string   "dating"
    t.text     "description"
    t.string   "code"
    t.string   "place"
    t.string   "size"
    t.string   "language"
    t.integer  "material_id"
    t.integer  "gallery_id"
=======
ActiveRecord::Schema.define(:version => 20130622024746) do

  create_table "audios", :force => true do |t|
    t.string   "title"
    t.integer  "artifact_id"
>>>>>>> 639617de4f518ef84ac89585d9159ec7adfb19ab
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

<<<<<<< HEAD
  create_table "materials", :force => true do |t|
=======
  create_table "galleries", :force => true do |t|
>>>>>>> 639617de4f518ef84ac89585d9159ec7adfb19ab
    t.string   "name"
    t.string   "language"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

<<<<<<< HEAD
=======
  create_table "photos", :force => true do |t|
    t.string   "title"
    t.integer  "artifact_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "language"
    t.integer  "artifact_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

>>>>>>> 639617de4f518ef84ac89585d9159ec7adfb19ab
end
