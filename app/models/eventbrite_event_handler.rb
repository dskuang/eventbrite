class EventbriteEventHandler
  attr_reader :data, :event, :ticket_classes, :saved_event

  def self.execute!(data)
    new(data).execute!
  end

  def initialize(data)
    @data = data
  end

  def execute!
    @event = EventbriteEvent.find_by(event_id: event_id)

    if !is_sold_out? || (is_sold_out? && !event_exist?)
      upsert_event!
      upsert_ticket_classes!
    end
  end

  private

  def upsert_event!
    @saved_event = 
      if (!event)
        EventbriteEvent.create!(event_data)
      else
        event.update!(event_data)
        event 
      end
      

    EventbriteEventUpdatedDetails.add_details!(
      data,
      saved_event.id,
      saved_event.event_id
    )
  end

  def upsert_ticket_classes!
    EventbriteTicketClassHandler.new(event_id, saved_event).execute!
  end

  def is_sold_out?
    data['ticket_availability']['is_sold_out']
  end

  def event_id
    data['id']
  end

  def event_exist?
    event.present?
  end

  def event_data
    @event_data ||= EventbriteEvent.formatted_data(data)
  end
end