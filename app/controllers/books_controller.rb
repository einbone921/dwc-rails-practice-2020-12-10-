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
    redirect_to :show
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
