class CommentsController < ApplicationController
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)

    if @comment.save
      redirect_to @commentable , notice: "Comment was successfully created!"
    else
      redirect_to @commentable , alert: "Error: Comment was not created."
    end
  end
private

def find_commentable
    params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
    end
end

def comment_params
    params.require(:comment).permit(:body)
end
end
