class StubhubApi
  include HTTParty

  URL = 'https://api.stubhub.com/sellers/oauth/accesstoken?grant_type=client_credentials'.freeze
  GET_EVENT_URL = 'https://api.stubhub.com/sellers/events/v3/{eventId}/status'

  def generate_access_token
    token = HTTParty.post(URL, body: body.to_json, headers: headers)
    data = OpenStruct.new(token.parsed_response)
    StubhubAccessToken.create!(
      refresh_token_expires_in: data.refresh_token_expires_in,
      token_type:               data.token_type,
      issued_at:                data.issued_at,
      client_id:                data.client_id,
      application_name:         data.application_name,
      refresh_token_issued_at:  data.refresh_token_issued_at,
      expires_in:               data.expires_in,
      refresh_count:            data.refresh_count,
      refresh_token_status:     data.refresh_token_status,
      access_token:             data.access_token,
      refresh_token:            data.refresh_token,
      status:                   data.status,
      user_guid:                data.user_guid
    )
  end

  def get_event(event_id)
    url = "https://api.stubhub.com/sellers/events/v3/#{event_id}/status"
    data = HTTParty.post(url, headers: { Accept: 'application/json', Authorization: access_token })
  end

  def get_listings
    url = 'https://api.stubhub.com/sellers/find/listings/v3/?eventId=104110797'
    data = HTTParty.get(url, headers: { Accept: 'application/json', Authorization: access_token })
  end

  private

  def access_token
    "Bearer #{StubhubAccessToken.last.access_token}"
  end

  def headers
    { "Authorization" => authorization, "Content-Type" => 'application/json' }
  end

  def authorization
    "Basic #{generate_authorization}"
  end

  def generate_authorization
    Base64.strict_encode64("#{CONSUMER_KEY}:#{CONSUMER_SECRET}")
  end

  def body
    {
    }
  end
end