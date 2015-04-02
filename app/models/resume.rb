class Resume < ActiveRecord::Base
  validates :user_name, presence: true
  validates :resume_name, presence: true
  validates :attachment, presence: true
  mount_uploader :attachment, ResumeUploader
  belongs_to :user
end
