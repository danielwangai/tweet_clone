class Tweet < ActiveRecord::Base
	has_attached_file :picture, :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100#" }
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  	belongs_to :user
  	has_many :retweets
end
