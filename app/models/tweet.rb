class Tweet < ActiveRecord::Base
  attr_accessible :content,:timage
  belongs_to :user
  mount_uploader :timage, ImageUploader
end
