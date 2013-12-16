$ ->
  $("[data-toggle='tooltip']").tooltip()

  $("#gif_url").on "keyup paste", ->
    $("#preview").html("<img src='#{$(this).val()}' />")

