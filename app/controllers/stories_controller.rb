class StoriesController < ApplicationController
  before_action :set_story, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.last
    if @story.nil?
      @story = Story.new(story_params)
      @story.user = current_user
    else
      @story.images.attach(story_params[:images])
    end

    respond_to do |format|
      if @story.save
        format.html { redirect_to root_path, notice: "Story was successfully created." }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to root_path, notice: "Story was successfully updated." }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @story.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Story was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:story_id, :user_id, images: [])
  end
end
