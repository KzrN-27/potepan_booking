$(document).on('turbolinks:load', function() {
    $("#header-icon").on({
        'click': function(){
            $(".user_menu").show();
        }
    })
  });