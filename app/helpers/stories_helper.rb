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
    # Find the next story ID.
    next_story_id = Story.where('id > ?', story_id).first.id

    # Return the next story ID.
    return next_story_id
  end
end
