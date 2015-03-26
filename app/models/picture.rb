class Picture < ActiveRecord::Base
  validates :user_name, presence: true
  validates :pic_name, presence: true
  validates :attachment, presence: true
  mount_uploader :attachment, AvatarUploader
end
