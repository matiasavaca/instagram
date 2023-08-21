json.extract! post, :id, :caption, :longitud, :latitud, :user_id, :allow_comments, :show_likes_count, :created_at, :updated_at
json.url post_url(post, format: :json)
