json.extract! question, :id, :question_text, :points, :quiz_id, :created_at, :updated_at
json.url question_url(question, format: :json)
