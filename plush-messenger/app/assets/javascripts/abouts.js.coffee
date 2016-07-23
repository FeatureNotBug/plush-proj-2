$("#addNewLink").on "click", ->
    $("#link_fields").append($("#new_link_form").html())

@removeLink = (element) ->
  element.parent().remove()
