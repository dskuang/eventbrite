class CreateTicketClassLogsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :ticket_class_logs do |t|
      t.integer     :eventbrite_ticket_class_id
      t.string      :name
      t.text        :description
      t.boolean     :free
      t.string      :on_sale_status
      t.bigint      :event_id
      t.bigint      :ticket_id
      t.boolean     :hidden_currently
      t.timestamps
    end
  end
end
