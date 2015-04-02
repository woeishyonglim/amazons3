class Resume < ActiveRecord::Base
  validates :user_name, presence: true
  validates :resume_name, presence: true
  validates :attachment, presence: true
  validate :is_doc
  mount_uploader :attachment, ResumeUploader
  belongs_to :user

  private
  def is_doc
    unless attachment and attachment.content_type =~ /^application\/(pdf|doc)$/
      errors.add(:attachment, "Not a valid document")
    end
  end
end
