API_ENDPOINT   = "https://api.tokyometroapp.jp/api/v2/"
DATAPOINTS_URL = API_ENDPOINT + "datapoints"
ACCESS_TOKEN   = "794570878acdb704b05cccdd9fbd34df4f2f85890d174db3eea557739dfeead2"

generateParam = (hash) -> 
  param = []
  for key, value of hash
    param.push("#{key}=#{value}")
  param.join("&") 

document.body.onload = ->
  d3.json(DATAPOINTS_URL + "?" +
      generateParam(
        "rdf:type" : "odpt:StationTimetable"
        "odpt:station" : "odpt.Station:TokyoMetro.Chiyoda.Otemachi"
        "acl:consumerKey" : ACCESS_TOKEN
      )
  ).get("",(error, data)-> 
    d3.select("#canvas").append("div").text(JSON.stringify(data))
  )