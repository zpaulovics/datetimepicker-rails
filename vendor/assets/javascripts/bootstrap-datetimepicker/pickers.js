//$(function() {
//    $('.datepicker').datepicker({
//        format: 'yyyy/MM/dd',
//        language: 'hu',
//        pickTime: false,
//        autoclose: true
//    });
//});

$(function() {
    $('.datetimepicker').datetimepicker({
        format: 'yyyy/MM/dd hh:mm',
        language: 'hu',
        pickSeconds: false,
        autoclose: true
    });
});

$(function() {
    $('.timepicker').datetimepicker({
        format: 'hh:mm',
        language: 'hu',
        pickDate: false,
        pickSeconds: false,
//      pick12HourFormat: true,
        autoclose: true
    });
});