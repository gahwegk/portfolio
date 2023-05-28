class UsersController < ApplicationController
 
  before_action :authenticate_user!
 
  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.page(params[:page]).reverse_order
    favorites = Favorite.where(user_id: current_user.id).pluck(:review_id)
    @favorite_list = Review.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
    
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
    render :edit
    end
      
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
