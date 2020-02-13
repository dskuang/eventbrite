class CreateTokensTable < ActiveRecord::Migration[6.1]
  def change
    create_table :application_tokens do |t|
      t.text         :value
      t.string       :token_type
      t.text         :description
      t.timestamps
    end
  end
end
