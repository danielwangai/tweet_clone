class AddAttachmentPictureToTweets < ActiveRecord::Migration
  def self.up
    change_table :tweets do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :tweets, :picture
  end
end
