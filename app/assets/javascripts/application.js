// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require moment/pl
//= require bootstrap-datetimepicker

$(document).on('ready page:change', function() {
  var hours = $('#hours').data('hours');

  $(function () {
      $('#datetimepicker1').datetimepicker({
      locale: 'pl',
      daysOfWeekDisabled: [0, 6],
      showClose: true,
      minDate: moment(),
      collapse: false,
      disabledTimeIntervals: [[moment({ h: 0 }), moment({ h: 7 })], [moment({ h: 18, m: 30 }), moment({ h: 24 })]],
      enabledHours: [8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18],
      stepping: 30
    });
  });
});
