class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :login_set, except: [:index]
  before_action :set_book, only: [:edit, :show]
  before_action :book_protect, only: [:edit, :update, :destroy]

 def index
    if current_user
      @books = Book.includes(:user).where(user_id: current_user)
      @q = Book.ransack(params[:q])   #検索オブジェクト     
      @books = @q.result(distinct: true)    #検索結果
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

 def search
  @q = Book.search(search_params)
  @books = @q.result(distinct: true)
 end
 

private
 def book_params
  params.require(:book).permit(:title,:author,:genre,:image,:buyday,:other).merge(user_id: current_user.id)
 end

 def set_book
  @book = Book.find(params[:id])
 end

 def login_set
  unless user_signed_in?
    redirect_to action: :index
  end
 end

 def book_protect
    set_book
  unless @book.user_id == current_user.id
    redirect_to root_path
  end
 end

 def search_params
  params.require(:q).permit!
 end


end
