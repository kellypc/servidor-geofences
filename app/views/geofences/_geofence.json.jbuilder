json.extract! geofence, :id, :name, :lat, :lon, :radius, :created_at, :updated_at
json.url geofence_url(geofence, format: :json)
