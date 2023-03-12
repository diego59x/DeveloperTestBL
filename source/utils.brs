function createViewObject(parentNode, viewObject, viewName)
    date = CreateObject("roDateTime")
    today = date.AsSeconds()

    if (viewObject = invalid)
        viewObject = CreateObject("roSGNode", viewName)
        viewObject.id = today.toStr() + viewName
    end if

    viewObject.opacity = 0
    viewObject.visible = false

    viewObject.translation = [1920, 0]
    parentNode.appendChild(viewObject)
    return viewObject
end function
