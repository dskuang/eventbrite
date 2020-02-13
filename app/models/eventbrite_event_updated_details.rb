class EventbriteEventUpdatedDetails < ApplicationRecord
  self.table_name = 'eventbrite_event_updated_details'

  belongs_to :eventbrite_event

  def self.add_details!(data, eventbrite_id, event_id)
    create!(formatted_data(data, eventbrite_id, event_id))
  end


  def self.formatted_data(data, eventbrite_id, event_id)
    {
      eventbrite_event_id:   eventbrite_id,
      event_id:              event_id,
      description:           data['description']['text'],
      summary:               data['summary'],
      has_available_tickets: data['ticket_availability']['has_available_tickets'],
      is_sold_out:           data['ticket_availability']['is_sold_out'],
      sales_status:          data['event_sales_status']['sales_status'],
      sales_message_code:    data['event_sales_status']['message_code'],
      start_sales_date:      data['event_sales_status']['start_sales_date'].try(:[], 'utc')
    }
  end
end