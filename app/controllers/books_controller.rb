class BooksController < ApplicationController
  def index
    @books = Book.all
    @book_new = Book.new
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
