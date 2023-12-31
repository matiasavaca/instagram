class CommentsController < ApplicationController
  before_action :set_post, only: %i[create]
  def create
    @post.comments.create(user: current_user, body: params[:comment_body])
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if(@comment.user == current_user)
      @comment.destroy
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(
          "post#{@comment.post_id}ModalComment#{@comment.id}",
        )
      end
    end
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
