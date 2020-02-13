class CreateEventbriteEventsDescriptionsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :eventbrite_event_updated_details do |t|
      t.integer       :eventbrite_event_id
      t.bigint        :event_id
      t.text          :description
      t.text          :summary
      t.boolean       :has_available_tickets
      t.boolean       :is_sold_out
      t.string        :sales_status
      t.string        :sales_message_code
      t.datetime      :start_sales_date
      t.timestamps
    end
  end
end
