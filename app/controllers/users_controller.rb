class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def index
    @user = User.all
	end

	def new
		@user = User.new
	end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
