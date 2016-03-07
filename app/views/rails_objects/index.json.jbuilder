json.array!(@rails_objects) do |rails_object|
  json.extract! rails_object, :id, :firstName, :lastName, :gender
  json.url rails_object_url(rails_object, format: :json)
end
