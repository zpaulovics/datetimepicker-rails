$(function() {
    $('.datepicker').datepicker({
        language: 'hu',
        pickTime: false,
        autoclose: true
    });
});

$(function() {
    $('.datetimepicker').datetimepicker({
        language: 'hu',
        pickSeconds: false,
        autoclose: true
    });
});

$(function() {
    $('.timepicker').datetimepicker({
        language: 'hu',
        pickDate: false,
        pickSeconds: false,
//      pick12HourFormat: true,
        autoclose: true
    });
});