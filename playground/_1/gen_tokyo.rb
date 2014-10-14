TOKYO = "13"
KANAGAWA = "14"
CHIBA = "12" 

# stations = open "station20140303free.csv"
# kanto_stations = open "station_kanto.csv", "w"
# stations.each_with_index do |station,i|
# 	pref = station.split(",")[6]
# 	kanto_stations.puts station if i == 0
# 	if  [TOKYO, KANAGAWA, CHIBA].include?(pref)
# 		kanto_stations.puts station 
# 	end
# end

# stations = open "station20140303free.csv"
# roppongi_stations = open "station_roppongi.csv", "w"
# stations.each_with_index do |station,i|
# 	name = station.split(",")[2]
# 	roppongi_stations.puts station if i == 0
# 	if  ["六本木", "日吉", "中目黒"].include?(name)
# 		roppongi_stations.puts station 
# 	end
# end

stations = open "station20140303free.csv"
tokyo_stations = open "station_tokyo.csv", "w"
stations.each_with_index do |station,i|
	name = station.split(",")[2]
	tokyo_stations.puts station if i == 0
	if  ["東京", "日吉", "二子玉川","新宿","渋谷","横浜"].include?(name)
		tokyo_stations.puts station 
	end
end