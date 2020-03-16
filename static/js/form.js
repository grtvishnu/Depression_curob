$(document).ready(function () {
    $('form').on('save-note-btn', function(event){
        $.ajax({
            data : {
                text : ('#note-textarea').val()
            },
            type: 'POST',
            url: '/Senti'
        })
        .done(function (data){
            $('#successAlert').text(data.text).show();
        })
    });
    event.preventDefault();
});
