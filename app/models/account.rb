class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :trackable

  mount_uploader :image, ProfilePictureUploader
  mount_uploader :cover_image, ProfilePictureUploader

  has_many :properties

  def full_name
    "#{first_name} #{last_name}"
  end  
end
