class BooksController < ApplicationController
  def index
  end

  def show
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @user = current_user
      render :index
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
