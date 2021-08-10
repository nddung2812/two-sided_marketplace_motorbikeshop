json.extract! service, :id, :job, :description, :price, :model, :make, :major_service, :address, :user_id, :created_at, :updated_at
json.url service_url(service, format: :json)
