json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :user_id, :forum_id, :fechaclase, :horaclase
  json.url reservation_url(reservation, format: :json)
end
