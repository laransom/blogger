$(function() {
  $('#new_comment').on('submit', function(event) {
    event.preventDefault();

    var $form = $(event.currentTarget);

    $.ajax({
      type: 'POST',
      url: $form.attr('action'),
      dataType: 'json',
      data: $form.serialize(),

      success: function(response) {
       var $commentAuthor = $('<h4>').text(response.author);
       var $commentBody = $('<p>').text(response.body);
       var $comment = $('<div>')
         .addClass('comment')
         .append($commentAuthor)
         .append($commentBody);

       var $commentFeed = $('.comment-feed');
       $commentFeed.prepend($comment);
      },

      error: function() {
        alert('Comment Unsuccessful');
      }
    });
  });
});
