sub init()
    m.imageThumb = m.top.findNode("imageThumb")
    m.itemTitle = m.top.findNode("itemTitle")
    m.subtitleItem = m.top.findNode("subtitleItem")
    m.descriptionItem = m.top.findNode("descriptionItem")

    m.itemTitle.font.size = 30
    m.subtitleItem.font.size = 25
    m.descriptionItem.font.size = 20
    

    m.top.observeField("focusedChild", "onFocus")
end sub

sub onContentUpdate()
    m.content = m.top.content

    ' Props
    m.imageThumb.uri = m.content.thumb
    m.itemTitle.text = m.content.title
    m.subtitleItem.text = m.content.subtitle
    m.descriptionItem.text = m.content.description
end sub

sub onFocus()
    'Focus element, show focusImage
end sub

