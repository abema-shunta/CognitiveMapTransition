TOKYO = "13"
KANAGAWA = "14"
CHIBA = "12" 

stations = open "station20140303free.csv"
kanto_stations = open "station_kanto.csv", "w"
stations.each_with_index do |station,i|
	pref = station.split(",")[6]
	kanto_stations.puts station if i == 0
	if  [TOKYO, KANAGAWA, CHIBA].include?(pref)
		kanto_stations.puts station 
	end
end