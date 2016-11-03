
// Character count tracking

var max = 139;
$('#char-num').text(max - $('#textarea1').val().length)

$('#textarea1').on('input', function(){
  var len = $(this).val().length;
  if (len > max) {
    var char = len - max;
    $('#char-num').text(char + ' over');
  } else {
    var char = max - len;
    $('#char-num').text(char);
  }
})
