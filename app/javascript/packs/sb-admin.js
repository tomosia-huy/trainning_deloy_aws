setTimeout(() => {
  let message = document.querySelector('.message');
  if (message) { message.style.display = 'none'; }
}, 5000);

$(document).ready(() => {
  // modal close on click outside
  $("body").on("click", ".modal-dialog", ".modal-close", function(e) {
    if ($(e.target).hasClass('modal-dialog')) {
      var hidePopup = $(e.target.parentElement).attr('id');
      $('#' + hidePopup).modal('hide');
    }
  });

  $(document).on('keydown', ".modal-dialog", ".modal-close", function(e) {
    code = $(e.target).hasClass('modal-dialog')
    if (code.which == 27) {
      var hidePopup = $(e.target.parentElement).attr('id');
      $('#' + hidePopup).modal('hide');
    }
  });


  $(document).on("change", ".image-uploader", function (e) {
    if (e.target.files) {
      $('div#show-image-uploader').find("img").remove();
      var filesAmount = e.target.files.length;
      for (i = 0; i < filesAmount; i++) {
        var reader = new FileReader();
        reader.onload = function(event) {
            $($.parseHTML('<img class="image-article-preview">')).attr('src', event.target.result).appendTo("div#show-image-uploader");
        }
        reader.readAsDataURL(e.target.files[i]);
      }
    }
  })

  $(document).on("click", ".js-upload-image", function (e) {
    $(".image-uploader").click();
  })
})
