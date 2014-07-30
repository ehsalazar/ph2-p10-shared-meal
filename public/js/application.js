$(document).ready(function() {
  ChangeIt();
});

var totalCount = 10;
function ChangeIt()
{
var num = Math.ceil( Math.random() * totalCount );
document.body.background = '../images/'+num+'.jpg';
document.body.attr('style', 'no-repeat center center fixed')
}

