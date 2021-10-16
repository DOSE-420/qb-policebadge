const open = (data) => {
  $('#name').css('color', '#282828');

  $('#name').text(data.name);
  $('#dob').text(data.dateofbirth);
  $('#signature').text(data.name);

  $('#id-card').css('background', 'url(assets/images/lspd.png)');

  $('#id-card').show();
}

const close = () => {
  $('#name').text('');
  $('#dob').text('');
  $('#height').text('');
  $('#signature').text('');
  $('#sex').text('');
  $('#id-card').hide();
  $('#licenses').html('');
}

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case "open":
                open(event.data);
                break;
            case "close":
                close();
                break;
        }
    })
});
