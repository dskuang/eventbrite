class TicketClassLog < ApplicationRecord
  belongs_to :ticket_class, 
    class_name: 'EventbriteEventTicketClass',
    foreign_key: :eventbrite_ticket_class_id

  belongs_to :event, 
    class_name: 'EventbriteEvent',
    foreign_key: :event_id

  def self.formatted_data(data, eventbrite_ticket_class_id)
    {
      eventbrite_ticket_class_id: eventbrite_ticket_class_id,
      name:                       data['name'],
      description:                data['description'],
      free:                       data['free'],
      on_sale_status:             data['on_sale_status'],
      event_id:                   data['event_id'],
      ticket_id:                  data['id'],
      hidden_currently:           data['hidden_currently'],
    }
  end
end