json.extract! code, :id, :registration_datetime, :amount, :email, :code, :status, :created_at, :updated_at
json.url code_url(code, format: :json)
