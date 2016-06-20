define ['extra'], (extra)->
  console.log "Thiss Main and: #{extra}"
  s = skrollr.init()

  # do ->
  #   img = document.getElementsByTagName('img')
  #   h2 = document.getElementsByTagName('h2')
  #   # TweenLite.to img, 1,
  #   #   width: 400
  #   #   ease: 'Elastic.easeOut'
  #   TweenLite.to img, 2.5,
  #     ease: Elastic.easeIn.config(1, 0.3)
  #     y: 10

  svg = document.getElementById('menu')
  items = svg.querySelectorAll('.item')
  item = svg.querySelectorAll('svg')

  trigger = svg.getElementById('trigger')
  label = trigger.querySelectorAll('#label')[0]
  open = false
  #first scale the elements down
  #toggle menu when trigger is clicked

  toggleMenu = (event) ->
    `var event`
    if !event
      event = window.event
    event.stopPropagation()
    open = !open
    if open
      TweenMax.staggerTo items, 0.7, {
        scale: 1
        ease: Elastic.easeOut
      }, 0.05
      # label.innerHTML = '-'
      svg.style.pointerEvents = 'auto'
    else
      TweenMax.staggerTo items, .3, {
        scale: 0
        ease: Back.easeIn
      }, 0.05
      # label.innerHTML = '+'
      svg.style.pointerEvents = 'none'


  TweenLite.set items,
    scale: 0
    visibility: 'visible'
  svg.style.pointerEvents = 'none'
  #set up event handler
  trigger.addEventListener 'click', toggleMenu, false

  svg.onclick = (e) ->
    e.stopPropagation()


  #close the nav when document is clicked

  document.onclick = ->
    open = false
    TweenMax.staggerTo items, .3, {
      scale: 0
      ease: Back.easeIn
    }, 0.05
    label.innerHTML = '+'
    svg.style.pointerEvents = 'none'
