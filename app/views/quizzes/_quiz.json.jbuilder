json.extract! quiz, :id, :name, :pass_threshold, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
