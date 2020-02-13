desc "This task is called by the Heroku scheduler add-on"
task update_venue_events: :environment do
  puts "Upserting venue events..."
  EventbriteApi.refresh_venue_events!
  puts "done."
end