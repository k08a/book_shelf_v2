class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end
  
  def show
  #   @book = Book.find(params[:id])
  
  # @reviews = Review.where(book_id: params[:id])
  end
  
  def new 
    @book = Book.new
  end
  def create
    @book = Book.new(params_book)
    
    if @book.valid? 
      @book.save
      redirect_to root_path
    else
      flash[:alert] = @book.errors.full_messages
      render :new
    end
  end
  def edit
    # @book = Book.find(params[:id])
  end
  def update
    # @book = Book.find(params[:id])
    @book.update(params_book)
    
    # redirect_to "/items/#{@book.id}"
    redirect_to book_path(@book)
    # redirect_to book_path
    
  end
  def destroy
    # @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  def set_book
    @book = Book.find(params[:id])
  end
  def params_book
    params.require(:book).permit(:name, :price, :publish, :publish_date
    )
  end
    
end
