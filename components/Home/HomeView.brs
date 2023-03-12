sub init()
    m.container = m.top.findNode("container")
    
    m.top.observeField("focusedChild", "onFocus")
end sub

sub onContentUpdate()

end sub

sub onFocus()
    if (m.top.hasFocus())
    end if
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    handled = false
    if (press = true)
        handled = true
    end if

    return handled
end function
