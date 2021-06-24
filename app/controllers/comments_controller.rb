# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to [@commentable, @comments]
    else
      redirect_to @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end
