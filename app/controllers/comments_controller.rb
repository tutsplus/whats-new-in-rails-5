class CommentsController < ApplicationController
  def create
    @task = Task.find params[:task_id]
    @comment = @task.comments.build comment_params.merge({ user: current_user })

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [ @task.project, @task ], notice: "Comment posted." }
        format.js
      else
        format.html { redirect_to [ @task.project, @task ], alert: "Comment not posted." }
        format.js { head 422 }
      end
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:body)
  end
end
