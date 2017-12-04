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
//= require_tree .

// $(document).ready(function() {
//   $('.selectpicker').selectpicker({size: 5});
// });

if (window.location.pathname === "/visits/new") {
  $(document).on('ready page:change', function() {
    var tStart = times.dataset.startTimes.substring(1,times.dataset.startTimes.length-1).split(",");
    var tEnd = times.dataset.endTimes.substring(1,times.dataset.endTimes.length-1).split(",");
    var its_now = moment()

    $(function () {
      $('#visit_date_time_picker').datetimepicker({
        locale: 'pl',
        format: "DD/MM/YYYY, HH[:00]",
        daysOfWeekDisabled: [0, 6],
        defaultDate: null,
        showClose: true,
        useCurrent: false,
        minDate: its_now,
        keepInvalid: true,
        collapse: true,
        inline: true,
        allowInputToggle: true,
        focusOnShow: false,
        sideBySide: false,
        stepping: 60
      });
      $("#visit_date_time_picker").on("dp.change", function (e) {
        var chosen_date = e.date.format("YYYY-MM-DD HH:mm Z");
        var zajete_godziny = [];
        $.ajax({url: "reserved_datetimes", dataType:"json", data: { doctor_id: $('#doctor_id').val(), visit_date: chosen_date }, success: function(result){
          console.log(result);
          for(i=0; i<=result.length-1; i++) {
            var m = moment.utc(result[i].visit_date).format("HH");
            zajete_godziny.push(parseInt(m));
            console.log(parseInt(m));
          }
          var dzien_tygodnia = e.date.day();
          var start_time = parseInt(tStart[dzien_tygodnia-1])
          var end_time = parseInt(tEnd[dzien_tygodnia-1])
          var wolne_godziny = [];
          for (i = 0; i < 24; i++) {
            if (i>=start_time && i<end_time && !zajete_godziny.includes(i)) {
              wolne_godziny.push(i);
              // console.log(i);
            }
          }
          if (wolne_godziny.length == 0)
          {
            $('#brak_wolnych_godzin').show();
            $('#visit_date_time_picker').data('DateTimePicker').clear();
          }
          else
          {
            $('#visit_date_time_picker').data('DateTimePicker').enabledHours(wolne_godziny);
            $('#brak_wolnych_godzin').hide();
          }
        }});
      });
    });
  });
}

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
