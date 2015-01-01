// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// SESSIONS: Log In

$(function() {
    $(".login").click(function(event) {
        event.preventDefault();
        var loginForm = '<div>' +
            '<form accept-charset="UTF-8" action="/sessions" method="post">' +
            '<div style="display:none"><input name="utf8" type="hidden" value="✓">' +
            '<input name="authenticity_token" type="hidden" value="hnR+Y3/CAJa9trXUdZWLfQw6LkKHPO39/k6+g/Z0gjc=">' +
            '</div><input id="email" name="email" type="text" oldautocomplete="remove" autocomplete="off">' +
            '<input name="password" placeholder="password" type="password">' +
            '<input name="remember_me" type="checkbox" value="1">'
            '<label for="remember_me">Remember me</label>'
            '<a class="reset-password" href="/reset_password">'Forgot Password?</a>
            '<input name="commit" type="submit" value="Reset Password"></form><a href="#" class="remove-field">Close</a></div>';
            '<input name="commit" type="submit" value="Log In" class="btn">'

        $(".login-info").append(loginForm);

    });
});


// SESSIONS: Password Reset

$(function() {
  $(".reset-password").click(function(event) {
    event.preventDefault();
    var resetPasswordForm = '<div><form accept-charset="UTF-8" action="/reset_password" method="post"><div style="display:none"><input name="utf8" type="hidden" value="✓"><input name="authenticity_token" type="hidden" value="hnR+Y3/CAJa9trXUdZWLfQw6LkKHPO39/k6+g/Z0gjc="></div><input id="email" name="email" type="text" oldautocomplete="remove" autocomplete="off"><input name="commit" type="submit" value="Reset Password"></form><a href="#" class="remove-field">Close</a></div>';
    $(".reset-password").hide();
    $(".password-form").append(resetPasswordForm);
    $(".password-form").addClass("reset-box-style");
    $(".log-in").children('form').addClass("gray-back");
    //Gray back rest of login form?

    $(".password-form").on("click", ".remove-field", function(event) {
      event.preventDefault();

      $(this).parent('div').remove();
      $(".reset-password").show();
      $(".log-in").children('form').removeClass("gray-back");
    });
  });
});

