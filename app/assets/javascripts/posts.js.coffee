# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
console.log('JS LOADED');
$(document).ready ->
  console.log 'JS LOADED'
  $("#publishBtn").on 'click', ->
    pagePath = $("#pagePath").val()
    post =
      title: $("#title").html()
      show_date: $("#showDateBox").is(':checked')
      body: $("#body").html()
    $.post("/" + pagePath, post, (data) ->
      window.location '/'+pagePath
    ).fail ->
      alert("ERROR")
  $("#editBtn").on 'click', ->
    pagePath = $("#pagePath").val()
    url = if (pagePath == '') then "#{$('#post').data('post-id')}" else "/#{ pagePath }/#{$('#post').data('post-id')}"
    post =
      title: $("#title").html()
      show_date: $("#showDateBox").is(':checked')
      body: $("#body").html()
    $.ajax(url,
      data: post
      processData: true
      type: "put"
    ).done(->
      window.location = '/'+pagePath
    ).fail (jqXhr, status, err) ->
      alert('ERROR, failed to save post: ' + err)