class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :image, :name, :screen_name, :bio
  attr_accessor :login
  # attr_accessible :title, :body
  
  has_many :tweets,dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follows
  has_many :following_users, through: :follows,source: :user
  has_many :innverse_follows,class_name: Follow,foreign_key: :followed_id
  has_many :followed_users, through: :inverse_follows 

  mount_uploader :image, ImageUploader

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value",{:value => login.downcase}]).first
  end


  
  def followed? user
    Follow.exists?(usesr_id: user.id,followed_id: self.id)
  end  
end
