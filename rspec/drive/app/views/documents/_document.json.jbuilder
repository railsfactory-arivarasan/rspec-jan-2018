json.extract! document, :id, :name, :folder_id, :size, :created_at, :updated_at
json.url document_url(document, format: :json)
