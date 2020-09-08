class PostCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.book_id = @book.id
    @comment.save
    render "comments"
    # redirect_to book_path(book)
  end


  # def destroy
    # PostComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    # redirect_back(fallback_location: root_url)
  # end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @book = @post_comment.book
    if @post_comment.user != current_user
      render "destroy"
    end
    @post_comment.destroy
    render "destroy"
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
