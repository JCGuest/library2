class BooksController < ApplicationController
before_action :set_author
before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @book = @author.books
    end

    def new   
        @book = @author.books.build
    end
    

    def show 
        @book = Book.find(params[:id])
    end

    def create 
        @book = @author.books.build(book_params)
        if @book.save 
            redirect_to author_book_path(@author, @book)
        else
            render :new 
        end
    end

    def edit 

    end

    def update
        if @book.update(book_params)
            redirect_to author_book_path(@author, @book)
        else
            render :edit
        end
    end

    def destroy
        @book.destroy 
        redirect_to author_books_path(@author)
    end

 private

    def set_book
        unless @book = Book.find_by_id(params[:id])
            redirect_to author_books_path(@author)
        end
    end

    def set_author
        unless @author = Author.find_by_id(params[:author_id])
            redirect_to authors_path
        end
    end

    def book_params
        params.require(:book).permit(:title)
    end
end
