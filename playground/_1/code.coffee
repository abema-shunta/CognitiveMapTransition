WIDTH = 900
HEIGHT = 500

MIN_LAT = 34.976704
MIN_LON = 139.035611
MAX_LAT = 35.979172
MAX_LON = 140.863096

REAL_WIDTH = MAX_LAT - MIN_LAT
REAL_HEIGHT = MAX_LON - MIN_LON

scale = 1500

lat2height = (lat) ->
  ((lat - MIN_LAT) / REAL_WIDTH) * WIDTH
lon2width = (lon) -> 
  ((lon - MIN_LON) / REAL_HEIGHT) * HEIGHT

drawD3Document = (data,color) -> 

  projection = d3.geo
  .mercator()   
  .scale(scale) 
  .center([(MAX_LON+MIN_LON)/2, (MAX_LAT+MIN_LAT)/2 + 3]); 

  svg = d3.select("#canvas")
      .append("svg")
      .attr("width", WIDTH)
      .attr("height", HEIGHT)

  stations = svg.selectAll("circle")
    .data(data)
    .enter().append("circle")
    .attr("cx", (d) -> projection([d.lon, d.lat])[0])
    .attr("cy", (d) -> projection([d.lon, d.lat])[1])
    .attr("r", scale * 0.0002)
    .style("fill","#333")
    # .style("fill", (d) ->
    #   switch d.station_name
    #     when "東京" then return "#F00"
    #     when "日吉" then return "#0F0"
    #     when "横浜" then return "#00F"
    #     when "渋谷" then return "#FF0"
    #     when "新宿" then return "#F0F"
    #     when "二子玉川" then return "#0FF"
    #     else return "#000"
    # )

  zoom = d3.behavior.zoom().on('zoom', ->
    projection.scale(scale * d3.event.scale)     
    console.log(d3.event.scale)
    stations.attr("cx", (d) -> projection([d.lon, d.lat])[0])
    .attr("cy", (d) -> projection([d.lon, d.lat])[1])
    .attr("r", d3.event.scale * scale * 0.0002)
  )

  svg.call(zoom)
 
  drag = d3.behavior.drag().on('drag', ->
    tl = projection.translate()
    projection.translate([tl[0] + d3.event.dx, tl[1] + d3.event.dy])
    stations.attr("cx", (d) -> projection([d.lon, d.lat])[0])
    .attr("cy", (d) -> projection([d.lon, d.lat])[1])

  )
  svg.call(drag)

document.body.onload = ->

  data = d3.csv "station20140303free.csv", (loadedRows) ->
    rows = loadedRows
    drawD3Document(rows,"#F00")

