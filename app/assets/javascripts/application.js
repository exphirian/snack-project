// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
///= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require keymaster.js
//= require bootstrap-alert.js
//= require bootstrap-tab.js
//= require bootstrap-tooltip.js
//= require bootstrap-popover.js
//= require bootstrap-collapse.js
//= require jquery.ui.datepicker-fr.js

$(function(){
  $("input.date_picker").datepicker($.datepicker.regional['fr-FR']);
  $(".alert-message").alert()
  $("a[rel=popover]")
    .popover()
    .click(function(e) {
      e.preventDefault()
    })
  //$('#navbar').scrollspy();
  
  $('.search-query').focus();
  key('⌘+up,shift+up', function(event){
    console.log('command+up, or shift+up');
    window.location="/contacts";
    return false;
  });
});