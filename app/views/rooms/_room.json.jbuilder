json.extract! room, :id, :name, :code, :floor, :capacity, :accesories, :created_at, :updated_at
json.url room_url(room, format: :json)
