class AvatarsController < ApplicationController
  before_action :set_employee

  def new
    @avatar = @employee.avatars.build
  end

  def index
    @avatar = Avatar.where(user_id: current_user)
  end

  def create
    @avatar = @employee.avatars.build(avatar_params)

    if @avatar.save
      flash[:notice] = "Avatar has been created."
      redirect_to root_path
    else
      flash.now[:alert] = "Avatar has not been craeted."
      render "new"
    end
  end

  def show
    @picture = Avatar.find(params[:id])
  end

  def show_pic
    @user = Avatar.find(params[:id])
    @avatar_name = @user.attachment.path.split("/").last
    if (params[:op] == 'thumb')
      @file = @user.attachment.url(:thumb)
    else
      @file = @user.attachment.url
    end
    send_data open(@file).read, :disposition => 'inline', :filename => @avatar_name
  end

  def destroy
    @picture = Avatar.find(params[:id])
    @picture.destroy
    redirect_to user_avatars_url, alert: "The picture #{@picture.pic_name} has been deleted."
  end

  private
    def set_employee
      @employee = User.find(current_user)
    end

    def avatar_params
      params.require(:avatar).permit(:user_name, :pic_name, :attachment)
    end
end
