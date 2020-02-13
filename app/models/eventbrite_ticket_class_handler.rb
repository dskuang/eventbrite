class EventbriteTicketClassHandler
  attr_reader :event_id, :saved_event

  def initialize(event_id, saved_event)
    @event_id = event_id
    @saved_event = saved_event
  end

  def execute!
    has_more_items = true
    continuation_key = ''
    data = fetch_ticket_classes!
    ticket_classes = data.parsed_response['ticket_classes']

    while(has_more_items)
      ticket_classes.each do |ticket_data|
        ticket_class = upsert_ticket_class!(ticket_data)
        insert_ticket_log!(ticket_data, ticket_class)
      end

      has_more_items = data.parsed_response['pagination']['has_more_items']
      continuation_key = data.parsed_response['pagination']['continuation']
    end
  end

  private

  def fetch_ticket_classes!
    EventbriteApi.fetch_ticket_class_details!(event_id)
  end

  def upsert_ticket_class!(data)
    id = data['id']

    ticket_class = EventbriteEventTicketClass.find_by(ticket_id: id)
    ticket_class_data = EventbriteEventTicketClass.formatted_data(data, saved_event.id)

    if(!ticket_class)
      EventbriteEventTicketClass.create!(ticket_class_data)
    else
      ticket_class.update!(ticket_class_data)
      ticket_class
    end
  end

  def insert_ticket_log!(data, ticket_class)
    ticket_log_data = TicketClassLog.formatted_data(data, ticket_class.id)
    TicketClassLog.create!(ticket_log_data)
  end
end