class BooksController < ApplicationController
  before_action :correct_book, only: [:edit, :destroy]
  def index
    @book = Book.new #new book用
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
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
    if @book.update(book_params)#bookのアップデート,user_idは変わらないから大丈夫
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)#bookの詳細ページへのパス
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id]) #削除するレコードを取得
    @book.destroy #削除
    redirect_to books_path
  end

  def correct_book
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

