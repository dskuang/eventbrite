class EventbriteTicketClassHandler
  attr_reader :event_id, :saved_event

  TIME_INTERVALS = [1, 2, 4, 6, 8, 10, 15, 20, 30, 60]

  def initialize(event_id, saved_event)
    @event_id = event_id
    @saved_event = saved_event
  end

  def execute!
    has_more_items = true
    continuation_key = ''

    while(has_more_items)
      data = fetch_ticket_classes!
      ticket_classes = data.parsed_response['ticket_classes']

      ticket_classes.each do |ticket_data|
        ticket_class = upsert_ticket_class!(ticket_data)
        insert_ticket_log!(ticket_data, ticket_class)
      end

      has_more_items = data.parsed_response['pagination']['has_more_items']
      continuation_key = data.parsed_response['pagination']['continuation']
    end

    queue_up_jobs! if !sales_started? && never_queued_up?
  end

  private

  def fetch_ticket_classes!
    EventbriteApi.fetch_ticket_class_details!(event_id)
  end

  def queue_up_jobs!
    TIME_INTERVALS.each do |num|
      queued_up_at = start_date + num.minutes
      sidekiq_id = EventTicketClassWorker.perform_at(queued_up_at, id: saved_event.id)

      SidekiqLog.create!(
        status:              'unprocessed',
        eventbrite_event_id: saved_event.id,
        queued_up_at:        queued_up_at,
        sidekiq_id:          sidekiq_id
      )
    end
  end

  def never_queued_up?
    SidekiqLog.where(eventbrite_event_id: saved_event.id).blank?
  end

  def sales_started?
    start_date < Time.current
  end

  def start_date
    saved_event.start_sales_date
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