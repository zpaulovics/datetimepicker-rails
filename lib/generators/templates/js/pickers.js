$(function() {
    $('.datepicker').datetimepicker({
        language: 'hu',
        weekStart: 1,
        pickTime: false,
        autoclose: true
    });
});

$(function() {
    $('.datetimepicker').datetimepicker({
        language: 'hu',
        weekStart: 1,
        pickSeconds: false,
        autoclose: true
    });
});

$(function() {
    $('.timepicker').datetimepicker({
        language: 'hu',
        weekStart: 1,
        pickDate: false,
        pickSeconds: false,
//      pick12HourFormat: true,
        autoclose: true
    });
});