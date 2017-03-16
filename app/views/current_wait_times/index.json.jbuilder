json.array!(@current_wait_times) do |current_wait_time|
  json.extract! current_wait_time, :id
  json.url current_wait_time_url(current_wait_time, format: :json)
end
