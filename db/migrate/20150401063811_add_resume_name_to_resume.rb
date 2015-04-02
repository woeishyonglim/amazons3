class AddResumeNameToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :resume_name, :string
  end
end
