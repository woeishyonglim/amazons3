class Avatar < ActiveRecord::Base
  validates :user_name, presence: true
  validates :pic_name, presence: true
  validates :attachment, presence: true

  belongs_to :user
  mount_uploader :attachment, AvatarUploader


end
