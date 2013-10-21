class Follow < ActiveRecord::Base
  attr_accessible :followed_user
  belongs_to :user
  belongs_to :followed_user,class_name: User,foreign_key: :followed_id
end
