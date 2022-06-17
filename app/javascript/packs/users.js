$(document).ready(function () {
  $(document).on("change", ".upload-avatar", function (e) {
    if (e.target.files) {
      var filesAmount = e.target.files.length;
      for (i = 0; i < filesAmount; i++) {
        var reader = new FileReader();
        reader.onload = function (event) {
          $("img.profile-avatar").attr('src', event.target.result);
        }
        reader.readAsDataURL(e.target.files[i]);
      }
    }
  })

  $(document).on("click", ".js-upload-avatar", function (e) {
    $(".upload-avatar").click();
  })
})