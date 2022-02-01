$(document).on('turbolinks:load', function () {
  $('p').on('click', function () {
    $(this).scss('color', 'blue');
  });
});
