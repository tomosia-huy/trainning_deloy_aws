class UsersController < ApplicationController
  def show
    @user     = User.find_by_id(params[:id])
    @articles = @user.articles.includes(:media_articles)
    @article  = @user.articles.new
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update(permit_param)
    redirect_back fallback_location: request.referrer
  end

  private

  def permit_param
    params.require(:user).permit(:first_name, :last_name, :address, :phone_number, :avatar)
  end
end
