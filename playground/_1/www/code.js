var HEIGHT, MAX_LAT, MAX_LON, MIN_LAT, MIN_LON, REAL_HEIGHT, REAL_WIDTH, WIDTH, drawD3Document, lat2height, lon2width, scale;
WIDTH = 900;
HEIGHT = 500;
MIN_LAT = 34.976704;
MIN_LON = 139.035611;
MAX_LAT = 35.979172;
MAX_LON = 140.863096;
REAL_WIDTH = MAX_LAT - MIN_LAT;
REAL_HEIGHT = MAX_LON - MIN_LON;
scale = 1500;

lat2height = function(lat) {
  return ((lat - MIN_LAT) / REAL_WIDTH) * WIDTH;
};

lon2width = function(lon) {
  return ((lon - MIN_LON) / REAL_HEIGHT) * HEIGHT;
};

drawD3Document = function(data) {
  var drag, projection, stations, svg, zoom;
  projection = d3.geo.mercator().scale(scale).center([(MAX_LON + MIN_LON) / 2, (MAX_LAT + MIN_LAT) / 2 + 3]);
  svg = d3.select("#canvas").append("svg").attr("width", WIDTH).attr("height", HEIGHT);
  stations = svg.selectAll("circle").data(data).enter().append("circle").attr("cx", function(d) {
    return projection([d.lon, d.lat])[0];
  }).attr("cy", function(d) {
    return projection([d.lon, d.lat])[1];
  }).attr("r", scale * 0.0002).style("fill", "#333");
  zoom = d3.behavior.zoom().on('zoom', function() {
    projection.scale(scale * d3.event.scale);
    console.log(d3.event.scale);
    return stations.attr("cx", function(d) {
      return projection([d.lon, d.lat])[0];
    }).attr("cy", function(d) {
      return projection([d.lon, d.lat])[1];
    }).attr("r", d3.event.scale * scale * 0.0002);
  });
  svg.call(zoom);
  drag = d3.behavior.drag().on('drag', function() {
    var tl;
    tl = projection.translate();
    projection.translate([tl[0] + d3.event.dx, tl[1] + d3.event.dy]);
    return stations.attr("cx", function(d) {
      return projection([d.lon, d.lat])[0];
    }).attr("cy", function(d) {
      return projection([d.lon, d.lat])[1];
    });
  });
  return svg.call(drag);
};

document.body.onload = function() {
  var data;
  return data = d3.csv("station20140303free.csv", function(loadedRows) {
    var rows;
    rows = loadedRows;
    return drawD3Document(rows);
  });
};
