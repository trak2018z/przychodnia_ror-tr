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

$( document ).ready(function() {
  $('.selectpicker').selectpicker({size: 5});
});

$(document).on('ready page:change', function() {
  var hours = $('#hours').data('hours');

  $(function () {
      $('#visit_date_time_picker').datetimepicker({
      locale: 'pl',
      daysOfWeekDisabled: [0, 6],
      showClose: true,
      minDate: moment(),
      inline: true,
      focusOnShow: false,
      sideBySide: true,
      disabledTimeIntervals: [[moment({ h: 0 }), moment({ h: 7 })], [moment({ h: 18, m: 30 }), moment({ h: 24 })]],
      enabledHours: [8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18],
      stepping: 30
    });
  });
});

function searchNameFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("searchNameInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("tabelaLekarzy");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}

function searchSpecFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("searchSpecInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("tabelaLekarzy");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
