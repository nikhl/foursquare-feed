class PostsController < ApplicationController

  respond_to :html

  def index
    Post.pull_checkins(current_user)
    @posts = Kaminari.paginate_array(current_user.posts).page(params[:page]).per(100)
  end

end