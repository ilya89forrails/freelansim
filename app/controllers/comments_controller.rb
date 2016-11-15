class CommentsController < ApplicationController

def new
end


def create
  @comment = Comment.new(comment_params)
  @comment.project_id = params[:project_id]

  @comment.save

  redirect_to project_path(@comment.project)
end

def comment_params
  params.require(:comment).permit(:user, :body)
end


end
