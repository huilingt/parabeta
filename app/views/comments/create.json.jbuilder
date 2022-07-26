if @comment.persisted?
  json.form json.partial!("comments/form.html.erb", review: @review, comment: Comment.new)
  json.inserted_item json.partial!("reviews/comment.html.erb", comment: @comment)
else
  json.form json.partial!("comments/form.html.erb", review: @review, comment: @comment)
end
