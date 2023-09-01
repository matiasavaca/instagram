module StoriesHelper
  def next_story_modal
    # Get the current story modal ID.
    current_story_modal_id = document.getElementById('storyModal' + @story.id)

    # Find the next story modal ID.
    next_story_modal_id = document.getElementById('storyModal' + (@story.id + 1))

    # If the next story modal exists, open it.
    if next_story_modal_id
      document.getElementById(current_story_modal_id).modal('hide')
      document.getElementById(next_story_modal_id).modal('show')
    end
  end

  def next_story_id(story_id)
    # Find the next story ID of the current user.
    next_story = Story.where('id > ?', story_id).first

    # If there's no next story for the current user, find the first story of the next user.
    unless next_story
      next_user = User.where('id > ?', current_user.id).first
      next_story = next_user.stories.first if next_user
    end

    # Return the next story ID if it exists, otherwise return nil.
    return next_story&.id
  end
end
