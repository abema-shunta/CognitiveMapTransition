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

campas = new Campas id: "main"

class CognitiveMapController
  constructor: (options)->

  

window.onload = ->
  campas.adjustToWindow()

window.onresize = ->
  campas.adjustToWindow()



