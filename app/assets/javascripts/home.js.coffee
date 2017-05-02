# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  makeRespone = (request) ->
    $("#send-api").hide()
    $("#another-api").show()
    $("#res-status").show()
    $("#res-body").show()
    $("#res-headers").show()
    $("strong").show()

    $("#res-status").text request.status + ":" + request.statusText
    $("#res-body").text request.responseText          
    $("#res-headers").text request.getAllResponseHeaders()
  anotherAPI = ( ) ->

    $("#send-api").show()
    $("#res-status").hide()
    $("#res-body").hide()
    $("#res-headers").hide()
    $("strong").hide()
    $("#another-api").hide()

  anotherAPI()

  $("#another-api").on "click", ->
    anotherAPI()

  $("#send-api").on "click", ->
    $.ajax
      url:  $("#url").val()
      type: $("#method").val()
      mimetype: $("#mimetype").val()
      data: $("#body").val()
      beforeSend: (xhr) ->
        xhr.setRequestHeader('X-Test-Header', 'test-value')
      success: (data, textStatus, request) ->
        makeRespone request

      error: (request, status, error) ->
        console.log request.responseText
        console.log request
        console.log status
        console.log error

        makeRespone request
    