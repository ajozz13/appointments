# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
processMessage = (input) ->
        json_obj = $.parseJSON(input)
        #$("#msgbox_txt").append json_obj.notice + "<br />" + json_obj.status + "<br />" + json_obj.object
        $("#msgbox_txt").empty()
        $("#msgbox_txt").append json_obj.notice
        highlight "#33CC33"
        return

processErrorMessage = (msg, err) ->
        $("#msgbox_txt").empty()
        $("#msgbox_txt").append msg + "<br />"
        for message of err
          $("#msgbox_txt").append err[message]+"<br />"
        highlight "#FF1919"
        return  
      
highlight = (id, col) ->
        $("#msgbox").effect "highlight",
          color: col
        , 4500
        return
        
$(document).on("ajax:success", ".appointment_form", (e, data, status, xhr) ->
        processMessage xhr.responseText
        ).on "ajax:error", (e, xhr, status, error) ->
          #alert(xhr.responseJSON.errors)
          processErrorMessage "Could not process your entry.", xhr.responseJSON.errors      
    
remove_tags = (link) ->
  #$(link).prev("input[type=hidden]").val("true")
  alert "deleting"
  $(link).parent().parent("tr").hide()
  return false
  
$(document).on 'click', '.link-delete', ->
     remove_tags this
    
