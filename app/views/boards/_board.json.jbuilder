json.extract! board, :id, :board_short_name, :board_desc, :created_at, :updated_at
json.url board_url(board, format: :json)
