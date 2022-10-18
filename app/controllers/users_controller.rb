class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]
  def index
    @book = Book.new #new book用
    @users = User.all
  end

  def show
    @book = Book.new #new book用
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) #ユーザーの取得
    if @user.update(user_params)#ユーザーのアップデート
      flash[:notice] = 'User was successfully updated.'
      redirect_to user_path(@user.id)#ユーザーの詳細ページへのパス
    else
      render :edit
    end
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end


