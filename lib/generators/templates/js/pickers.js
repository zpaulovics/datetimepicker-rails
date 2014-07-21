$(document).on('ready page:change', function() {
    $('.datepicker').datetimepicker({
        pickTime: false
    });
});

$(document).on('ready page:change', function() {
    $('.datetimepicker').datetimepicker({
        autoclose: true,
        pickSeconds: false
    });
});

$(document).on('ready page:change', function() {
    $('.timepicker').datetimepicker({
        pickDate: false,
        pickSeconds: false
    });
});