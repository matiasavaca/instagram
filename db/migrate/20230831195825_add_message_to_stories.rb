class AddMessageToStories < ActiveRecord::Migration[7.0]
  def change
    add_column :stories, :story_message, :text
  end
end
