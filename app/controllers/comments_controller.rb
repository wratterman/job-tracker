class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]
    @comment.save

    flash[:success] = "Comment posted"
    redirect_to company_job_path(@comment.job.company, @comment.job)
  end

  def show
    @comment = Comment.find([params[:id]])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to company_job_path(@comment.job.company, @comment.job)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :job_id, )
  end
end
