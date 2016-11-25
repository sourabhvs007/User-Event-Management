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
//= require turbolinks
//= require bootstrap.min
//= require_tree .
//= require jquery.validate.min


$(document).ready(function () {
$("#new_user").validate({

rules: {
"user[fname]": {required: true, firstname: true},
"user[lname]": {required: true, lastname: true},
"user[username]": {required: true, username: true},
"user[phone]": {required: true, phone: true,maxlength: 10},
"user[email]": {required: true, email: true},
"user[password]": {required: true, minlength: 6},
"user[password_confirmation]": {required: true, equalTo: "#user_password"}
// submitHandler: function(form) { form.submit();}
}
});
});

 // ################################## datepicker################################################
 $("document").ready(function(){

        $( "#datepicker" ).datepicker({
           minDate: 0
       });


})
 // #########################################################################################