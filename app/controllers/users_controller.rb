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
  end


  def show
    @user = current_user
    @book = @user.books
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
