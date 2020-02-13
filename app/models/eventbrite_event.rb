class EventbriteEvent < ApplicationRecord
  has_many :updated_details, 
    class_name: 'EventbriteEventUpdatedDetails', 
    foreign_key: :eventbrite_event_id

  has_many :ticket_classes, 
    class_name: 'EventbriteEventTicketClass',
    foreign_key: :eventbrite_event_id

  def self.formatted_data(data)
    {
      event_name:             data['name']['text'],
      event_id:               data['id'],
      venue_id:               data['venue_id'],
      category_id:            data['category_id'],
      subcategory_id:         data['subcategory_id'],
      organization_id:        data['organization_id'],
      organizer_id:           data['organizer_id'],
      format_id:              data['format_id'],
      url:                    data['url'],
      description:            data['description']['text'],
      summary:                data['summary'],
      time_zone:              data['start']['timezone'],
      start_time_utc:         data['start']['utc'],
      end_time_utc:           data['end']['utc'],
      currency:               data['currency'],
      is_sold_out:            data['ticket_availability']['is_sold_out'],
      has_ga_hold_tiers:      data['basic_inventory_info']['has_ga_hold_tiers'],
      listed:                 data['listed'],
      shareable:              data['shareable'],
      online_event:           data['online_event'],
      is_reserved_seating:    data['is_reserved_seating'],
      has_inventory_tiers:    data['basic_inventory_info']['has_inventory_tiers'],
      has_ticket_classes:     data['basic_inventory_info']['has_ticket_classes'],
      is_series:              data['is_series'],
      listing_is_paid:        data['listing_properties']['is_paid'],
      is_externally_ticketed: data['is_externally_ticketed'],
      inventory_type:         data['inventory_type'],
      age_restriction:        data['music_properties']['age_restriction'],
      minimum_ticket_price:   data['ticket_availability']['minimum_ticket_price'].try(:[], 'value'),
      maximum_ticket_price:   data['ticket_availability']['maximum_ticket_price'].try(:[], 'value'),
      start_sales_date:       data['event_sales_status']['start_sales_date'].try(:[], 'utc'),
      event_created_at:       data['created'],
      event_changed_at:       data['changed'],
      event_published_at:     data['published']
    }
  end
end