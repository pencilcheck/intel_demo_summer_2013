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

ActiveRecord::Schema.define(:version => 0) do

  create_table "dd", :force => true do |t|
    t.integer  "node_id", :null => false
    t.integer  "X"
    t.integer  "Y"
    t.float    "temp"
    t.float    "hum"
    t.integer  "region"
    t.datetime "time",    :null => false
  end

  add_index "dd", ["time"], :name => "time"

  create_table "state", :id => false, :force => true do |t|
    t.integer "1",                   :default => 0, :null => false
    t.integer "2",                   :default => 0, :null => false
    t.integer "3",                   :default => 0, :null => false
    t.integer "4",                   :default => 0, :null => false
    t.integer "5",                   :default => 0, :null => false
    t.integer "6",                   :default => 0, :null => false
    t.integer "7",                   :default => 0, :null => false
    t.integer "8",                   :default => 0, :null => false
    t.integer "9",                   :default => 0, :null => false
    t.integer "10",                  :default => 0, :null => false
    t.integer "11",                  :default => 0, :null => false
    t.integer "12",                  :default => 0, :null => false
    t.integer "13",                  :default => 0, :null => false
    t.integer "14",                  :default => 0, :null => false
    t.integer "15",                  :default => 0, :null => false
    t.integer "16",                  :default => 0, :null => false
    t.string  "time", :limit => 100,                :null => false
  end

  create_table "wk", :force => true do |t|
    t.integer "node_id",                  :null => false
    t.integer "X"
    t.integer "Y"
    t.integer "region"
    t.string  "neighbor", :limit => 100
    t.float   "energy"
    t.string  "time",     :limit => 1000
  end

  add_index "wk", ["time"], :name => "time", :length => {"time"=>333}

end
