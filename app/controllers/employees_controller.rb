class EmployeesController < ApplicationController

  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
      @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to root_path, notice: "The picture #{@picture.pic_name} has been uploaded."
    else
      render "new", notice: "Picture has not been created."
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to root_url, alert: "The picture #{@picture.pic_name} has been deleted."
  end

  private
    def picture_params
      params.require(:picture).permit(:user_name, :pic_name, :attachment)
    end
end
