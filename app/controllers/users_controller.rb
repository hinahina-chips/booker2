class UsersController < ApplicationController

  def index
    @book = Book.new #new book用
    @users = User.all
  end

  def show
    @book = Book.new #new book用
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) #ユーザーの取得
    @user.update(user_params)#ユーザーのアップデート
    redirect_to user_path(@user.id)#ユーザーの詳細ページへのパス
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end


