class EventbriteApi
  include HTTParty

  def self.fetch_ticket_class_details!(event_id)
    url = "https://www.eventbriteapi.com/v3/events/#{event_id}/ticket_classes/"
    HTTParty.get(url, headers: headers)
  end

  def self.refresh_venue_events!
    venues = EventbriteVenue.all

    venues.each do |venue|
      has_more_items = true
      continuation_key = ''

      while(has_more_items)
        data = save_venue_events!(venue.venue_id, continuation_key)

        has_more_items = data.parsed_response['pagination']['has_more_items']
        continuation_key = data.parsed_response['pagination']['continuation']
      end
    end
  end

  def self.save_venue_events!(venue_id, continuation_key)
    data = fetch_venue(venue_id, continuation_key)
    events = data.parsed_response['events']

    events.each do |raw_event_data|
      EventbriteEventHandler.execute!(raw_event_data)
    end

    data
  end

  def self.fetch_venue(venue_id, continuation_key)
    continuation_header = continuation_key.present? ? 
      "&continuation=#{continuation_key}" : ''
    
    url = "https://www.eventbriteapi.com/v3/venues/#{venue_id}/events/?expand=#{expand_options}#{continuation_header}"
    HTTParty.get(url, headers: headers)
  end

  def self.fetch_event(event_id)
    url = "https://www.eventbriteapi.com/v3/events/#{event_id}?expand=#{expand_options}"
    HTTParty.get(url, headers: headers)
  end

  class << self
    private

    def expand_options
      [
        'ticket_availability',
        'guestlist_metrics',
        'listing_properties',
        'basic_inventory_info',
        'event_sales_status',
        'external_ticketing',
        'music_properties',
        'logo',
        'image'
      ].join(',')
    end

    def headers
      { "Authorization" => authorization, "Content-Type" => 'application/json' }
    end

    def authorization
      "Bearer #{PRIVATE_EVENTBRITE_TOKEN}"
    end
  end
end