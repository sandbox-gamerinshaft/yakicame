class Follow < ActiveRecord::Base
  attr_accessible :followed_user
  default_scope includes(:user,:followed_user)
  belongs_to :user
  belongs_to :followed_user,class_name: User,foreign_key: :followed_id
  validate :not_follow_oneself
  validates :followed_id,uniqueness: {scope: :user_id}
  validates_associated :user
  validates_associated :followed_user

  private
  
  def not_follow_oneself
    if user_id == followed_id
      errors.add :followed_id,"Can't follow oneself"
    end
  end
end
