json.extract! post, :id, :name, :description, :price, :used_vehicle, :make, :model, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
