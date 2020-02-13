class EventbriteEventTicketClass < ApplicationRecord
  has_many :ticket_class_logs, 
    class_name: 'TicketClassLog',
    foreign_key: :eventbrite_ticket_class_id

  def self.formatted_data(data, eventbrite_event_id)
    {
      eventbrite_event_id:        eventbrite_event_id,
      actual_cost:                data['actual_cost'],
      actual_fee:                 data['actual_fee'],
      cost:                       data['cost'].try(:[], 'value'),
      fee:                        data['fee'].try(:[], 'value'),
      tax:                        data['tax'].try(:[], 'value'),
      resource_uri:               data['resource_uri'],
      display_name:               data['display_name'],
      name:                       data['name'],
      description:                data['description'],
      free:                       data['free'],
      minimum_quantity:           data['minimum_quantity'],
      maximum_quantity:           data['maximum_quantity'],
      maximum_quantity_per_order: data['maximum_quantity_per_order'],
      on_sale_status:             data['on_sale_status'],
      has_pdf_ticket:             data['has_pdf_ticket'],
      event_id:                   data['event_id'],
      ticket_id:                  data['id'],
      hidden_currently:           data['hidden_currently'],
      sales_start_after:          data['sales_start_after']
    }
  end
end