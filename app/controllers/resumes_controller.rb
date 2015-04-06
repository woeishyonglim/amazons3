class ResumesController < ApplicationController
  before_action :set_employee

  def index
    @resumes = Resume.where(user_id: current_user)
  end

  def new
    @resume = @employee.resumes.build
  end

  def create
    @resume = @employee.resumes.build(resume_params)
    if @resume.save
      flash[:notice] = "Resume has been created."
      redirect_to user_resumes_url
    else
      flash.now[:alert] = "Resume has not been craeted."
      render "new"
    end
  end

  def show_resume
    @resume = Resume.find(params[:id])
    @resume_name = @resume.attachment.path.split("/").last
    @file = @resume.attachment.url
    send_data open(@file).read, :disposition => 'inline', :filename => @resume_name
  end

  def show
    @resume = Resume.find(params[:id])
    @resume_name = @resume.attachment.path.split("/").last
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to user_resumes_url, alert: "The resume #{@resume.user_name} has been deleted."
  end

  private
    def set_employee
      @employee = User.find(current_user.id)
    end

    def resume_params
      params.require(:resume).permit(:user_name, :attachment, :resume_name)
    end
end
