class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :show]

 def index
    if current_user
      @books = Book.includes(:user).where(user_id: current_user)
    else
      redirect_to new_user_session_path
    end
 end

 def new
  @book =Book.new
 end

 def create
  Book.create(book_params)
  redirect_to root_path, notice: "本を登録しました"
 end

 def edit
 end

 def update
  book = Book.find(params[:id])
  book.update(book_params)
  redirect_to book_path(params[:id]), notice: "更新しました" 
 end

 def show
 end

 def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to root_path, notice: "本のデータを削除しました"
end

private
 def book_params
  params.require(:book).permit(:title,:author,:genre,:image,:buyday,:other).merge(user_id: current_user.id)
 end

 def set_book
  @book = Book.find(params[:id])
end

end
