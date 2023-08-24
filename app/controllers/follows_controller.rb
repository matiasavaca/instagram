class FollowsController < ApplicationController
  before_action :set_user, only: %i[follow cancel_request unfollow]
  before_action :set_follow_req, only: %i[accept_follow decline_follow]
  def follow
    current_user.follow(@user)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  def cancel_request
    current_user.cancel_request(@user)
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_back(fallback_location: root_path)
  end

  def accept_follow
    @follow_req.accept
    redirect_back(fallback_location: root_path)
  end

  def decline_follow
    @follow_req.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_follow_req
    @follow_req = Follow.find(params[:follow_id])
  end
end
