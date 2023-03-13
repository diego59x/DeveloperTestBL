sub init()
    m.carouselTitle = m.top.findNode("carouselTitle")
    m.carouselContainer = m.top.findNode("carouselContainer")

    m.top.observeField("focusedChild", "onFocus")
end sub

sub onContentUpdate()
    m.content = m.top.content
    m.carouselTitle.text = m.content.name

    date = CreateObject("roDateTime")
    xPosition = 0

    for each item in m.content.videos
        today = date.AsSeconds()
        itemC = CreateObject("roSGNode", "carouselItem")
        itemC.id = today.toStr() + "carouselItem"
        
        itemC.content = item
        itemC.translation = [730 * xPosition, 0]
        xPosition += 1

        m.carouselContainer.appendChild(itemC)
    end for
end sub

sub onFocus()
    'Focus first element
end sub

'OnKeyEvent here to manage movements
'Move carousel with animation by size of item