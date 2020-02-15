class AddColumnsToEventbriteEvent < ActiveRecord::Migration[6.1]
  def change
    add_column('eventbrite_events', 'original_image_url', 'text')
    add_column('eventbrite_events', 'altered_image_url', 'text')
  end
end
