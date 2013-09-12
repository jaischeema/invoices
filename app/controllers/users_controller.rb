class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorise_user!, except: :index
  before_action :authorise_admin!, only: :index

  def index; end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Unable to save verify errors."
      render 'edit'
    end
  end

  protected

  def authorise_user!
    @user = User.find(params[:id])
    unless current_user == @user or current_user.admin?
      redirect_to root_path, alert: "No authorised to view this page"
    end
  end

  private
  def user_params
    params.require(:user).permit(:trading_name, :abn, :phone, :address_line_1, :address_line_2, :suburb, :state, :postcode)
  end
end