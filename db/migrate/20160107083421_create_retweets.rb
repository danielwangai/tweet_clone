class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.text :retweet
      t.references :user, index: true, foreign_key: true
      t.references :tweet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
