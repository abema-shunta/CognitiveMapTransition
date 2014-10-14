kanto_stations = open "station_kanto.csv"

lon_i = 9
lat_i = 10

min_lat = 999999.0
min_lon = 999999.0
max_lat = 0.0
max_lon = 0.0

kanto_stations.each_with_index do |s,i|
	unless i == 0
	station = s.split(",")
		min_lat = station[lat_i].to_f if station[lat_i].to_f < min_lat
		min_lon = station[lon_i].to_f if station[lon_i].to_f < min_lon
		max_lat = station[lat_i].to_f if station[lat_i].to_f > max_lat
		max_lon = station[lon_i].to_f if station[lon_i].to_f > max_lon
	end
end 

puts [min_lat, min_lon, max_lat, max_lon]