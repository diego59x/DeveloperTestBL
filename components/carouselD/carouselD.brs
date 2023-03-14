sub init()
    m.carouselTitle = m.top.findNode("carouselTitle")
    m.carouselContainer = m.top.findNode("carouselContainer")

    m.top.observeField("focusedChild", "onFocus")

    m.transRightAnimation = m.top.FindNode("transRightAnimation")
    m.transGroupRight = m.top.findNode("transGroupRight")
    m.transRightAnimation.observeField("state", "onAnimationRightSlideState")

    m.transLeftAnimation = m.top.FindNode("transLeftAnimation")
    m.transGroupLeft = m.top.findNode("transGroupLeft")
    m.transLeftAnimation.observeField("state", "onAnimationLeftSlideState")

    m.amountElements = 0
    m.currentElementPos = 0
end sub

sub onFocus()
    'Focus first element
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
        
        carouselItemBounding = itemC.boundingRect()
        m.top.widthElement = carouselItemBounding["width"]
        
        itemC.content = item
        itemC.translation = [730 * xPosition, 0]
        xPosition += 1


        m.carouselContainer.appendChild(itemC)
    end for
    m.amountElements = xPosition

    ' First value for animation
    translationOfCarousel = m.carouselContainer.translation
    newX = translationOfCarousel[0] - m.top.widthElement
    m.transGroupRight.keyValue = [translationOfCarousel, [ newX, translationOfCarousel[1] ]]

end sub

function onAnimationRightSlideState(event as object)
    state = event.getData()

    ' Calculate next position of animation
    
    if (state = "stopped")

        m.currentElementPos +=1
        ' Calculate value of next Right position
        translationOfCarousel = m.carouselContainer.translation
        newX = translationOfCarousel[0] - m.top.widthElement - 10 '-10 due a set of 10 extra pixels to seperate items
        m.transGroupRight.keyValue = [translationOfCarousel, [ newX, translationOfCarousel[1] ]]
        ' prinT "RIGHT 1 ", m.transGroupRight.keyValue[0][0], m.transGroupRight.keyValue[1][0]
        
        ' Calculate value of next Left position
        newX = translationOfCarousel[0] + m.top.widthElement + 10 '-10 due a set of 10 extra pixels to seperate items
        m.transGroupLeft.keyValue = [translationOfCarousel, [ newX, translationOfCarousel[1] ]]
        ' prinT "LEFT 1 ", m.transGroupLeft.keyValue[0][0], m.transGroupLeft.keyValue[1][0]

    end if
end function

function onAnimationLeftSlideState(event as object)
    state = event.getData()
    ' Calculate next position of animation
    if (state = "stopped")

        m.currentElementPos -=1

        ' Calculate value of next Left position
        translationOfCarousel = m.carouselContainer.translation
        newX = translationOfCarousel[0] + m.top.widthElement + 10 '-10 due a set of 10 extra pixels to seperate items
        m.transGroupLeft.keyValue = [translationOfCarousel, [ newX, translationOfCarousel[1] ]]
        ' prinT "LEFT 2 ", m.transGroupLeft.keyValue[0][0], m.transGroupLeft.keyValue[1][0] 

        ' Calculate value of next Right position
        newX = translationOfCarousel[0] - m.top.widthElement - 10 '-10 due a set of 10 extra pixels to seperate items
        m.transGroupRight.keyValue = [translationOfCarousel, [ newX, translationOfCarousel[1] ]]
        ' prinT "RIGHT 2 ", m.transGroupRight.keyValue[0][0], m.transGroupRight.keyValue[1][0]

    end if
end function

function onKeyEvent(key as string, press as boolean) as boolean
    handled = false

    if(press)
        if (key="right")
            ' Check position of element
            if (m.currentElementPos < m.amountElements - 1)
                m.transRightAnimation.control = "start"
            end if
            
            handled = true
        end if

        if (key="left")
            ' Check position of element
            if (m.currentElementPos > 0)
                m.transLeftAnimation.control = "start"
            end if
            
            handled = true
        end if
    end if

    return handled
end function
