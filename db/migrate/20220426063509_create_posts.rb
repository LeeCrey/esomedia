class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.belongs_to :user, null: false, foreign_key: true

      ## only will have [me, followers, followers] respectivaly me = 0, ...
      t.integer :who_can_see, null: false, default: 0

      ## boolean values
      t.boolean :can_commentable, null: false, default: true

      ## counter caches
      t.integer :comments_count, null: false, default: 0
      t.integer :cached_votes_total, default: 0
      t.integer :photos_count, null: false, default: 0

      t.datetime :last_edited_at
      t.timestamps
    end
    # Post.find_each(&:update_cached_votes)
  end
end
