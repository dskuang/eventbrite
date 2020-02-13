class CreateEventbriteVenuesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :eventbrite_venues do |t|
      t.bigint       :venue_id
      t.string       :name
      t.timestamps
    end
  end
end
