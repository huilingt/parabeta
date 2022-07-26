class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    @comment.review = @review
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        # redirect_to facility_path(@review.facility_id, anchor: "comment-#{@comment.id}")
        format.html { redirect_to facility_path(@review.facility_id), anchor: "comment-#{@comment.id}" }
        format.json

      else
        # redirect_to user_session_path, alerts: "You must be logged in to add a comment"
        format.html { render "facilties/show" }
        format.json
      end
    end
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
