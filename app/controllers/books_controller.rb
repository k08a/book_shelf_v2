class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new 
    @book = Book.new
  end
  def create
    @book = Book.new(params_book)
    @book.save
    redirect_to books_path
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    @book.update(params_book)
    redirect_to book_path
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  def params_book
    params.require(:book).permit(:name, :price, :publish, :publish_date
    )
  end
    
end
