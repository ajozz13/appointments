# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
processMessage = (input) ->
        json_obj = $.parseJSON(input)
        #$("#msgbox_txt").append json_obj.notice + "<br />" + json_obj.status + "<br />" + json_obj.object
        $("#msgbox_txt").append json_obj.notice
        $("#msgbox").effect "highlight",
                color: "#00CC99"
        , 4500
        return
      
$(document).on("ajax:success", ".appointment_form", (e, data, status, xhr) ->
        #$("#msgbox").append xhr.responseText
        processMessage xhr.responseText
        ).on "ajax:error", (e, xhr, status, error) ->
    $("#msgbox").append "Error processing your entry"
    
remove_tags = (link) ->
  #$(link).prev("input[type=hidden]").val("true")
  alert "deleting"
  $(link).parent("tr").hide()
  return false
  
$(document).on 'click', '.link-delete', ->
     remove_tags this
    
