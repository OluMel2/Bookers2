class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @user = current_user
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
       render "edit"
    else
       redirect_to user_path(current_user)
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  else
    render :edit
  end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end