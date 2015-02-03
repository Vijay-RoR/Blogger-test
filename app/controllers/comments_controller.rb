class CommentsController < ApplicationController
  before_action :find_post

  def new
    @post = find_post
    @comment = @post.comments.build
  end

  def create
    puts "-----#{params_comment.inspect} ---#{@post.inspect}"
    @comment = @post.comments.build(params_comment)
    puts "here comeeeeeeeeeeeeeeesssssssssssss #{@comment.inspect}"
    if @comment.save!
      redirect_to @post
    else
      redirect_to new_new_post_comment_path(@post)
    end
  end

  private
  def find_post
    @post =Post.find(params[:post_id])
  end

  def params_comment
    params.require(:comment).permit(:post_id, :description)
  end
end
