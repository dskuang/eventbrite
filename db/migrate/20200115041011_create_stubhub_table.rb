class CreateStubhubTable < ActiveRecord::Migration[6.1]
  def change
    create_table :stubhub_access_tokens do |t|
      t.bigint    :refresh_token_expires_in
      t.string    :token_type
      t.bigint    :issued_at
      t.string    :client_id
      t.string    :application_name
      t.bigint    :refresh_token_issued_at
      t.bigint    :expires_in
      t.integer   :refresh_count
      t.string    :refresh_token_status
      t.string    :access_token
      t.string    :refresh_token
      t.string    :status
      t.string    :user_guid
      t.timestamps
    end
  end
end
