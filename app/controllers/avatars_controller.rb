class AvatarsController < ApplicationController
  before_action :set_employee
  before_action :find_avatar, only:[:show, :show_pic, :destroy]

  def new
    @avatar = @employee.avatars.build
  end

  def index
    @avatars = Avatar.where(user_id: current_user)
  end

  def create
    @avatar = @employee.avatars.build(avatar_params)
    if @avatar.save
      flash[:notice] = "Avatar has been created."
      redirect_to user_avatars_url
    else
      flash.now[:alert] = "Avatar has not been craeted."
      render "new"
    end
  end

  def show
  end

  def show_pic
    @avatar_name = @avatar.attachment.path.split("/").last
    if (params[:op] == 'thumb')
      @file = @avatar.attachment.url(:thumb)
    else
      @file = @avatar.attachment.url
    end
    send_data open(@file).read, :disposition => 'inline', :filename => @avatar_name
  end

  def destroy
    @avatar.destroy
    redirect_to user_avatars_url, alert: "The avatar #{@avatar.pic_name} has been deleted."
  end

  private
    def find_avatar
      @avatar = Avatar.find(params[:id])
    end

    def set_employee
      @employee = User.find(current_user)
    end

    def avatar_params
      params.require(:avatar).permit(:user_name, :pic_name, :attachment)
    end
end
