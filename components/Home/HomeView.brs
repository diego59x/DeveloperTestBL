sub init()
    m.container = m.top.findNode("container")
    m.carouselD = m.top.findNode("carouselD")

    m.top.observeField("focusedChild", "onFocus")
end sub

sub onContentUpdate()
    m.carouselD.content =  m.top.content
end sub

sub onFocus()
    if (m.top.hasFocus())
        m.carouselD.setFocus(true)
    end if
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    handled = false
    if (press = true)
        handled = true
    end if

    return handled
end function
