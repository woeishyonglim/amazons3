class EmployeesController < ApplicationController
  require 'open-uri'
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

  def show_pic
    @user = Picture.find(params[:id])
    if (params[:op] == 'thumb')
      @file = @user.attachment.url(:thumb)
    else
      @file = @user.attachment.url
    end
    send_data open(@file).read, :disposition => 'inline', :filename=>"photo.jpg"
  end

  def show_local_pic
    send_file Rails.root.join('app', 'assets', 'images', 'photo.jpg'), :type => "image/jpeg", :disposition => "inline"
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
