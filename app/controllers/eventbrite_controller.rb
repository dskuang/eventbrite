class EventbriteController < ApplicationController
  def refresh
  end

  def index
    eventbrite_events = EventbriteEvent.all.order(id: :desc)
    @first_half_events = eventbrite_events[0.. eventbrite_events.length/2]
    @second_half_events = eventbrite_events[eventbrite_events.length/2 + 1.. eventbrite_events.length - 1]

    render layout: 'eventbrite'
  end

  def event_data
  end
end