class CreateTicketClassTable < ActiveRecord::Migration[6.1]
  def change
    create_table :eventbrite_event_ticket_classes do |t|
        t.integer     :eventbrite_event_id
        t.bigint      :actual_cost
        t.bigint      :actual_fee
        t.bigint      :cost
        t.bigint      :fee
        t.integer     :tax
        t.text        :resource_uri
        t.string      :display_name
        t.string      :name
        t.text        :description
        t.boolean     :free
        t.integer     :minimum_quantity
        t.integer     :maximum_quantity
        t.integer     :maximum_quantity_per_order
        t.string      :on_sale_status
        t.boolean     :has_pdf_ticket
        t.bigint      :event_id
        t.bigint      :ticket_id
        t.boolean     :hidden_currently
        t.bigint      :sales_start_after
        t.timestamps
    end
  end
end
