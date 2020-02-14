class CreateSidekiqLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :sidekiq_logs do |t|
      t.string      :status
      t.bigint      :eventbrite_event_id
      t.text        :sidekiq_id
      t.timestamp   :queued_up_at
      t.timestamp   :finished_at
      t.timestamps
    end
  end
end
