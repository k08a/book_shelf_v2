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
  end
  
  private
  def params_book
    params.require(:book).permit(:name, :price, :publish, :publish_date
    )
  end
    
end
