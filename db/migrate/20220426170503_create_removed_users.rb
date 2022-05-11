class CreateRemovedUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :removed_users do |t|
      t.integer :user_id, null: false
      t.integer :removed_user_id, null: false

      t.timestamps
    end
    add_index :removed_users, :user_id
    add_index :removed_users, :removed_user_id
    add_index :removed_users, %i[user_id removed_user_id], unique: true
  end
end
