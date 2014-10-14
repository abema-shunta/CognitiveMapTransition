API_ENDPOINT   = "http://0.0.0.0:3000/"
DATAPOINTS_URL = API_ENDPOINT + "transit"
ACCESS_TOKEN   = "794570878acdb704b05cccdd9fbd34df4f2f85890d174db3eea557739dfeead2"

generateParam = (hash) -> 
  param = []
  for key, value of hash
    param.push("#{key}=#{value}")
  param.join("&") 

document.body.onload = ->
  d3.html(DATAPOINTS_URL).get("",(error, data)-> 
    console.log(data.textContent)
    d3.select("#canvas").append("div").html(data.textContent)
  )