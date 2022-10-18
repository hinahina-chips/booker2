class BooksController < ApplicationController
  def index
    @book = Book.new #new book用
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id]) #bookの取得
    @book.update(book_params)#bookのアップデート,user_idは変わらないから大丈夫
    redirect_to book_path(@book.id)#bookの詳細ページへのパス
  end

  def destroy
    @book = Book.find(params[:id]) #削除するレコードを取得
    @book.destroy #削除
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

