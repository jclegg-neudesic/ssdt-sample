$(document).ready(function () {
    $.ajax({
        url: "api/Customer"
    }).then(function (data) {
        $('.customer-id').append(data.Id);
        $('.customer-name').append(data.name);
    });
});