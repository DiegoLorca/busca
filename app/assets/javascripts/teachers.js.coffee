# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#//$(document).on "ajax:success", "form#teachers-form", (ev,data)->
#//	console.log data
#//	$(this).find("textarea").val("") //Esto me sirve para borrar el casillero donde ingrese datos
#//	$("teachers-box").append("<li>#{data.published_on}</li>")
#// ^^^^^^ Esto es para ocupar ajax ^^^^^^

jQuery ->
  $('#teacher_published_on').datepicker({
  dateFormat: 'dd-mm-yy'});
#//$(function() {
#//  $('.datepicker').datepicker();
#//});