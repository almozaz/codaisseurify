function createSong(title) {
  var newSong = { title: title };

  $.ajax({
    type: "POST",
    url: "/songs/" + songId + ".json",
    data: JSON.stringify({
        song: newSong
    }),
    contentType: "application/json",
    dataType: "json"})

    .done(function(data) {
      console.log(data);

      var checkboxId = "song-" + data.id;

      var listItem = $("<li></li>");
      listItem.addClass("song");
      listItem.attr('song-id', data.id);

      var deleteLink= $('<a></a>');
      checkbox.attr('href', '#');
      checkbox.attr('id', deleteId);
      checkbox.val(1);
      checkbox.bind('click', deleteSong);

      var deleteIcon = $('<span></span>')
      checkbox.attr('class', "glyphicon glyphicon-remove");

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

      error_message = error.responseJSON.title[0];
      showError(error_message);
    });
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
  createTodo($("#songinput").val());
  $("#songinput").val(null);
}

function deleteSong(songId) {
  $.ajax({
    type: "DELETE",
    url: "/songs/" + songId + ".json",
    contentType: "application/json",
    dataType: "json"});
}

$(document).ready(function() {
  // change this into a delete song acction
  $("deleteLink").bind('click', deleteSong);
  $("form#new_song").bind('submit', submitSong);
  // make this into a delete all button
  // $("#clean-up").bind('click', cleanUpDoneTodos);
});
