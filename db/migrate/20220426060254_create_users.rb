class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :username, unique: true

      t.date :birthdate, null: false
      t.integer :gender, null: false
      t.string :country, null: false

      t.string :hometown
      t.string :current_city
      t.datetime :last_seen_at

      t.string :biography
      t.integer :followings_count, null: false, default: 0
      t.integer :followers_count, null: false, default: 0
      t.integer :posts_count, null: false, default: 0
      t.integer :comments_count, null: false, default: 0
      t.integer :blocked_users_count, null: false, default: 0

      t.boolean :verified, null: false, default: false

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :country
    add_index :users, :current_city
    add_index :users, :first_name
    add_index :users, [:first_name, :last_name]
  end
end
