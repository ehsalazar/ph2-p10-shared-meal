$(document).ready(function() {
  ChangeIt();
  // loadScript;

});

var totalCount = 10;
function ChangeIt()
{
var num = Math.ceil( Math.random() * totalCount );
document.body.background = '../images/'+num+'.jpg';
// document.body.attr('style', 'no-repeat center center fixed')
}



// function loadScript() {
//   var script = document.createElement('script');
//   script.type = 'text/javascript';
//   script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
//       'callback=initialize';
//   document.body.appendChild(script);
// }

