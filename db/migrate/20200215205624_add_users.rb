class AddUsers < ActiveRecord::Migration[6.1]
  def change
    create_table "users", force: :cascade do |t|
      t.datetime "created_at",      null: false
      t.datetime "updated_at",      null: false
      t.string   "username"
      t.string   "password_digest", null: false
      t.string   "session_token",   null: false
      t.index ["username"], name: "index_users_on_username", unique: true
    end
  end
end
