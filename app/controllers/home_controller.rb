class HomeController < ApplicationController
  before_action :cleanup_old_stories, only: [:index]
  before_action :set_suggestions
  before_action :set_feeds
  include StoriesHelper

  def index
    @posts = Post.all
    @stories = Story.all

    @last_image_story = Story.first&.last_image

    @last_images_for_posts = {}
    @posts.each do |post|
      @last_images_for_posts[post.id] = post.last_image
    end


    if user_signed_in?
      @stories.each do |story|
        unless StoryHistory.exists?(user: current_user, story: story)
          StoryHistory.create(user: current_user, story: story)
        end
      end
    end
  end


  def cleanup_old_stories
    Story.where("created_at <= ?", 1.hours.ago).destroy_all
  end


  def next_user_with_story
    current_story_user_id = params[:current_user_id].to_i
    next_user = User.joins(:stories).where("users.id > ?", current_story_user_id).order("users.id ASC").first
    render json: { next_user_id: next_user&.id }
  end

  private
  def set_suggestions
    @suggestions = [current_user.followers]
    [current_user.followers, current_user.followings].flatten.uniq.each do |f|
      @suggestions.append([f.followers, f.followings])
    end
    @suggestions = [@suggestions, User.all.sample(10)].flatten.uniq - [current_user.followings, current_user].flatten
    @suggestions = @suggestions.sample(5)
  end

  def set_feeds
    @feeds = Post.where(user: [current_user, current_user.followings].flatten).order(created_at: :desc)
  end
end
