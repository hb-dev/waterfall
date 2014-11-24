jQuery(window).load ->
  jQuery(".colorpicker").colorpicker()
  # Takes the gutter width from the bottom margin of .news-item
  gutter = parseInt(jQuery(".news-item").css("marginBottom")) * 2
  container = jQuery("#news-items")
  
  # Creates an instance of Masonry on #news-items
  container.masonry
    gutter: gutter
    itemSelector: ".news-item"
    columnWidth: ".news-item"

  
  # This code fires every time a user resizes the screen and only affects .news-item elements
  # whose parent class isn't .container. Triggers resize first so nothing looks weird.
  
  # Resets all widths to 'auto' to sterilize calculations
  
  # Calculates how many .news-item elements will actually fit per row. Could this code be cleaner?
  
  # Ensures that all top-level elements have equal width and stay centered
  jQuery(window).bind("resize", ->
    unless jQuery("#news-items").parent().hasClass("container")
      item_width = jQuery(".news-item").width() + gutter
      jQuery("#news-items, body > .grid").css "width", "auto"
      items_per_row = jQuery("#news-items").innerWidth() / item_width
      floor_items_width = (Math.floor(items_per_row) * item_width) - gutter
      ceil_items_width = (Math.ceil(items_per_row) * item_width) - gutter
      items_width = (if (ceil_items_width > jQuery("#news-items").innerWidth()) then floor_items_width else ceil_items_width)
      items_width = "100%"  if items_width is jQuery(".news-item").width()
      jQuery("#news-items, .grid").css "width", items_width
      jQuery(".grid").css margin: "0 auto"
    return
  ).trigger "resize"
  return
