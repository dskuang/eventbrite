class EventTicketClassWorker < BaseWorker
  def perform!
    id = options.id
    event = EventbriteEvent.find_by_id(id)
    EventbriteTicketClassHandler.new(event.event_id, event).execute!
  end

  def post_perform!
    sidekiq_log = SidekiqLog.find_by(sidekiq_id: jid)
    sidekiq_log.update!(
      status:      'processed',
      finished_at: Time.current
    )
  end
end