$ ->
  $("[data-toggle='tooltip']").tooltip()

  $("#gif_url").on "keyup paste", ->
    $("#preview").html("<img src='#{$(this).val()}' />")

  $(document).keydown (e) ->
    if e.keyCode == 37
      if $(".pagination .active").length > 0
        prev = $(".pagination .active").prev().children().first().attr("href")
      else if $("#gif").length > 0
        prev = $("#gif").data("prev")

      window.location = prev if prev

    else if e.keyCode == 39
      if $(".pagination .active").length > 0
        next = $(".pagination .active").next().children().first().attr("href")
      else if $("#gif").length > 0
        next = $("#gif").data("next")
      window.location = next if next
