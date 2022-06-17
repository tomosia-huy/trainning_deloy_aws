class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  mount_uploader :avatar, AvatarUploader
  has_many :articles


  def fullname
    "#{first_name} #{last_name}"
  end

  def avatar_url
    avatar.url
  end
end
