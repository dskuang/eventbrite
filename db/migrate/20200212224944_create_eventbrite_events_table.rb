class CreateEventbriteEventsTable < ActiveRecord::Migration[6.1]
  def change   
    create_table :eventbrite_events do |t|
      t.text               :event_name
      t.bigint             :event_id
      t.bigint             :venue_id
      t.bigint             :category_id
      t.bigint             :subcategory_id
      t.bigint             :organization_id
      t.bigint             :organizer_id
      t.bigint             :format_id
      t.text               :url
      t.text               :description
      t.text               :summary
      t.string             :time_zone
      t.datetime           :start_time_utc
      t.datetime           :end_time_utc
      t.string             :currency
      t.boolean            :is_sold_out
      t.boolean            :has_ga_hold_tiers
      t.boolean            :listed
      t.boolean            :shareable
      t.boolean            :online_event
      t.boolean            :is_reserved_seating
      t.boolean            :has_inventory_tiers
      t.boolean            :has_ticket_classes
      t.boolean            :is_series
      t.boolean            :listing_is_paid
      t.boolean            :is_externally_ticketed
      t.string             :inventory_type
      t.string             :age_restriction
      t.integer            :minimum_ticket_price
      t.integer            :maximum_ticket_price
      t.datetime           :event_created_at
      t.datetime           :event_changed_at
      t.datetime           :event_published_at
      t.datetime           :start_sales_date
      t.timestamps
    end
  end
end
