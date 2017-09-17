// application.js

//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .


var pathname = window.location.pathname;
var parts = pathname.split("/");
var artistId = parts[parts.length-1];

function createSong(title) {

  $.ajax({
    type: "POST",
    url:  "/api/artists/" + artistId + "/songs.json",
    data: JSON.stringify({
      name: title
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
  console.log(data)
  var deleteId = "song-" + data.song.id;
  debugger;
  var listItem = $("<li></li>");
  listItem.addClass("song");
  listItem.attr('song-id', data.song.id);
  debugger;
  var deleteLink= $('<a></a>');
  deleteLink.attr('href', '#');
  deleteLink.attr('id', deleteId);
  deleteLink.attr('class', "delete-song");
  deleteLink.bind('click', deleteSong);
  debugger;
  var deleteIcon = $('<span></span>')
  deleteIcon.attr('class', "glyphicon glyphicon-remove");

  var space = document.createTextNode(" ");

  var label = $('<label></label>');
  label.attr('for', deleteId);
  label.html(data.title);

  deleteLink.append(deleteIcon);
  listItem.append(deleteLink);
  listItem.append(space);
  listItem.append(label);

  $("#songlist").append( listItem );
  })
  .fail(function(error) {
    console.log(error);
    debugger;
    // error_message = error.responseJSON.title[0];
    // showError(error_message);
  })
}

function showError(message) {
  $("#songinput").addClass("error");
  var errorElement = $("<small></small>")
    .attr("id", "error_message")
    .addClass("error")
    .html(message);
  $(errorElement).appendTo('form .field');
}

function resetErrors() {
  $("#error_message").remove();
  $("#songinput").removeClass("error");
}

function submitSong(event) {
  event.preventDefault();
  resetErrors();
  createSong($("#song_name").val());
  $("#song_name").val(null);
}

function deleteSong(event) {
  event.preventDefault();
  var listItem = $(this).parent().parent();
  var songId = $(listItem).data('id');
  $.ajax({
    type: "DELETE",
    url: "/api/artists/" + artistId + "/songs/" + songId + ".json",
    contentType: "application/json",
    dataType: "json"})
  .done(function(data) {
    listItem.remove();
  });
}

$(document).ready(function() {
  // change this into a delete song acction
  // $("deleteLink").bind('click', deleteSong);
  $("form").bind('submit', submitSong);
  $(".delete-song").bind('click', deleteSong);
  // make this into a delete all button
  // $("#clean-up").bind('click', cleanUpDoneTodos);
});
