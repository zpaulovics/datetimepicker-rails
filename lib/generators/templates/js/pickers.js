$(document).on('ready page:change', function() {
    $('.datepicker').datetimepicker({
        pickTime: false
    });
});

$(document).on('ready page:change', function() {
    $('.datetimepicker').datetimepicker({
        pickSeconds: false
    });
});

$(document).on('ready page:change', function() {
    $('.timepicker').datetimepicker({
        pickDate: false,
        pickSeconds: false
    });
});