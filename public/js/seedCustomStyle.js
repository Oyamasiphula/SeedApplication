$(document).ready(function(){
				//Products Search
	$("#search").keyup(function(){
		var issueTdPullreq = $("#issueTdPullreq").val();
		$.get("/issues/search/" + issueTdPullreq, function(results){
			$("#reqIssuesOutPut").html(results);
		  });
            // conditional statements as a layout manager for a proper search textBox output
                if (issueTdPullreq === true) {
        $.get("/issues/search/" + issueTdPullreq, function(results){
                    $("#reqIssuesOutPut").html(results);
          });

                } else if(issueTdPullreq === "" || false){
                    window.location.replace("http://localhost:2010/issues");

                  };

    });
});
setTimeout(function() {

  var canvas = document.getElementById('canvas'),
    context = canvas.getContext('2d'),
    height = canvas.height = document.body.offsetHeight,
    width = canvas.width = document.body.offsetWidth,
    passes = 0;

(function pass() {
    var x = width / 2 + Math.cos(passes) * (passes * 0.66); // change the multiplier
    var y = height / 2 + Math.sin(passes) * (passes * 0.66);
    makePattern(
        360 + passes * 2, // and the amount of particles per pass
        x, y, color(passes++));
    if( x > 0 ) {
        requestAnimationFrame(pass);
    }
}())
function color(i) {
    var r = Math.floor( Math.sin(i) * 127 + 128 );
    var g = Math.floor( Math.sin(i + 2) * 127 + 128 );
    var b = Math.floor( Math.sin(i + 3) * 127 + 128 );
    return 'rgb(' + r + ', ' + g + ',' + b + ')';
}
function makePattern(len, cx, cy, c) {
    context.fillStyle = c;
    for (var i = 0; i < len; i++) {
        var x = cx + Math.cos(i) * (i * 0.11); // this is the inner passes
        var y = cy + Math.sin(i) * (i * 0.11); // these numbers effect the smaller circles.
        context.beginPath();
        context.fillRect(x,y,1,1);
        context.closePath();
    }
}
  // codepen
}, 100);

