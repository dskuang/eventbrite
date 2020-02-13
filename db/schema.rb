# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_14_050739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_tokens", force: :cascade do |t|
    t.text "value"
    t.string "token_type"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eventbrite_event_ticket_classes", force: :cascade do |t|
    t.integer "eventbrite_event_id"
    t.bigint "actual_cost"
    t.bigint "actual_fee"
    t.bigint "cost"
    t.bigint "fee"
    t.integer "tax"
    t.text "resource_uri"
    t.string "display_name"
    t.string "name"
    t.text "description"
    t.boolean "free"
    t.integer "minimum_quantity"
    t.integer "maximum_quantity"
    t.integer "maximum_quantity_per_order"
    t.string "on_sale_status"
    t.boolean "has_pdf_ticket"
    t.bigint "event_id"
    t.bigint "ticket_id"
    t.boolean "hidden_currently"
    t.bigint "sales_start_after"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eventbrite_event_updated_details", force: :cascade do |t|
    t.integer "eventbrite_event_id"
    t.bigint "event_id"
    t.text "description"
    t.text "summary"
    t.boolean "has_available_tickets"
    t.boolean "is_sold_out"
    t.string "sales_status"
    t.string "sales_message_code"
    t.datetime "start_sales_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eventbrite_events", force: :cascade do |t|
    t.text "event_name"
    t.bigint "event_id"
    t.bigint "venue_id"
    t.bigint "category_id"
    t.bigint "subcategory_id"
    t.bigint "organization_id"
    t.bigint "organizer_id"
    t.bigint "format_id"
    t.text "url"
    t.text "description"
    t.text "summary"
    t.string "time_zone"
    t.datetime "start_time_utc"
    t.datetime "end_time_utc"
    t.string "currency"
    t.boolean "is_sold_out"
    t.boolean "has_ga_hold_tiers"
    t.boolean "listed"
    t.boolean "shareable"
    t.boolean "online_event"
    t.boolean "is_reserved_seating"
    t.boolean "has_inventory_tiers"
    t.boolean "has_ticket_classes"
    t.boolean "is_series"
    t.boolean "listing_is_paid"
    t.boolean "is_externally_ticketed"
    t.string "inventory_type"
    t.string "age_restriction"
    t.integer "minimum_ticket_price"
    t.integer "maximum_ticket_price"
    t.datetime "event_created_at"
    t.datetime "event_changed_at"
    t.datetime "event_published_at"
    t.datetime "start_sales_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eventbrite_venues", force: :cascade do |t|
    t.bigint "venue_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stubhub_access_tokens", force: :cascade do |t|
    t.bigint "refresh_token_expires_in"
    t.string "token_type"
    t.bigint "issued_at"
    t.string "client_id"
    t.string "application_name"
    t.bigint "refresh_token_issued_at"
    t.bigint "expires_in"
    t.integer "refresh_count"
    t.string "refresh_token_status"
    t.string "access_token"
    t.string "refresh_token"
    t.string "status"
    t.string "user_guid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ticket_class_logs", force: :cascade do |t|
    t.integer "eventbrite_ticket_class_id"
    t.string "name"
    t.text "description"
    t.boolean "free"
    t.string "on_sale_status"
    t.bigint "event_id"
    t.bigint "ticket_id"
    t.boolean "hidden_currently"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
