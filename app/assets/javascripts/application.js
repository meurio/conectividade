// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require parsley
//= require parsley.i18n.pt-br
//= require slick
//= require remodal
//= require_tree .

$(function(){
  $('.slick').slick();

  $('form.new_message, form.new_user').parsley();

  $('.data-role-link').on('click', function(e) {
    var role = $(this).data('role');
    $('#cadastro #user_role').val(role);
  });

  // Smooth scrooling
  function smoothScroll() {
    var target = this.hash, $target = $(target);

    $('html, body').stop().animate({
      'scrollTop': $target.offset().top
    }, 1000, 'swing', function () {
      window.location.hash = target;
    });
  }
  $(document).on('click', 'a.smooth', smoothScroll);

  // Share windows
  $('.facebook-share-button').click(function(event){
    event.preventDefault();
    window.open(
      $(this).attr('href'),
      'facebook-share-dialog',
      'height=450, width=550,' +
      'top=' + ($(window).height() / 2 - 225) + ',' +
      'left=' + ($(window).width() / 2 - 275) + ',' +
      'toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');
    return false;
  });

  $('.twitter-share-button').click(function(event){
    event.preventDefault();
    window.open(
      $(this).attr('href'),
      'twitter-share-dialog',
      'height=420, width=550,' +
      'top=' + ($(window).height() / 2 - 210) + ',' +
      'left=' + ($(window).width() / 2 - 275) + ',' +
      'toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');
    return false;
  });
});
