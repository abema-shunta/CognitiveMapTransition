class Campas
  constructor: (options) ->
    {@id, @width, @height} = options
  
  getDom: (-> document.getElementById @id)

  adjustToWindow: -> 
    @width = window.innerWidth
    @height = window.innerHeight
    @update()

  update: ->
    @getDom().setAttribute "width", @width+"px"
    @getDom().setAttribute "height", @height+"px"

class CognitiveMapController
  constructor: ->
    @stations = []
    @relations = []

  startTimer:
    @timer = setInterval(@draw, 1000)

  draw: 
    for station in @stations
      station.draw()
    for relation in @relations 
      relation.draw()

  stopTimer: 
    clearInterval(@timer)

  addStation(station):
    @stations.push(station)

class Station 
  constructor: (options) ->
    {@name, @x, @y}

campas = new Campas id: "main"
cognitiveMapController = new CognitiveMapController()


window.onload = ->
  campas.adjustToWindow()


window.onresize = ->
  campas.adjustToWindow()



