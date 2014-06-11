json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :start_time, :end_time, :first_name, :last_name, :comment
  json.url appointment_url(appointment, format: :json)
end
