class ContUsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :redirect_to_root, :if => :signed_in?

  def index
    @users = User.all.order('username ASC').page params['page']
    authorize @users
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[user_params])

    if @user.save
      redirect_to @user, :flash => { :success => 'User was successfully created.' }
    else
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to adminpanel_path
     else
       render 'edit'
     end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @users
    @user.destroy
    redirect_to users_path, :flash => { :success => 'User was successfully deleted.' }
  end

  private
    def set_user
        @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :role)
    end

    def signed_in?
      current_user.role == 'normal_user' ? true : false
    end

    def redirect_to_root
      redirect_to root_path
    end
end
