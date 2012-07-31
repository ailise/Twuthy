class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer :tweet_id, :limit => 8
      t.string :user
      t.string :text
      t.integer :twuthiness

      t.timestamps
    end
  end
  def self.down
      drop_table :tweets
    end
  end

