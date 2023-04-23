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
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
